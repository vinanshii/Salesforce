global class AccountEmailToContactsBatch 
implements Database.Batchable<SObject>, Database.Stateful {

    List<Contact> contactsToUpdate = new List<Contact>();
    Map<Id, Integer> countMap = new Map<Id, Integer>();
    Map<Id, Account> accMap = new Map<Id, Account>();

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Email__c FROM Account'
        );
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {

        for(Account acc : scope){
            accMap.put(acc.Id, acc);
        }

        for(Contact c : [
            SELECT Id, Email, AccountId
            FROM Contact
            WHERE AccountId IN :accMap.keySet()
        ]){

            Account acc = accMap.get(c.AccountId);

      
            if(acc != null && (c.Email == null || c.Email != acc.Email__c)){

                c.Email = acc.Email__c;
                contactsToUpdate.add(c);

                if(countMap.containsKey(c.AccountId)){
                    countMap.put(c.AccountId, countMap.get(c.AccountId)+1);
                } else {
                    countMap.put(c.AccountId, 1);
                }
            }
        }
    }

    global void finish(Database.BatchableContext bc) {


        if(!contactsToUpdate.isEmpty()){
            update contactsToUpdate;
        }

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(Id accId : countMap.keySet()){

            Account acc = accMap.get(accId);

            if(acc != null && acc.Email__c != null){

                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[]{acc.Email__c});
                mail.setSubject('Contact Email Update Info');
                mail.setPlainTextBody('Hello ' + ',Your ' + countMap.get(accId) + ' Contacts Email updated successfully.');

                emails.add(mail);
            }
        }

        if(!emails.isEmpty()){
            Messaging.sendEmail(emails);
        }
    }
}


//System.schedule('AccountEmail_00', '0 0 * * * ?', new SyncAccountEmailScheduler());
//System.schedule('AccountEmail_30', '0 30 * * * ?', new SyncAccountEmailScheduler());
