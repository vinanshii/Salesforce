global class AccountEmailScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {

        Database.executeBatch(new AccountEmailToContactsBatch(), 200);

    }
}

//System.schedule('AccountEmail_00', '0 0 * * * ?', new AccountEmailScheduler());
//System.schedule('AccountEmail_30', '0 30 * * * ?', new AccountEmailScheduler());