public with sharing class BearController {

    @AuraEnabled(cacheable=true)
    public static List<Bear__c> getAllBears() {
        return [
            SELECT Id, Name
            FROM Bear__c
            ORDER BY Name
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Bear__c> searchBears(String searchTerm) {
        String key = '%' + searchTerm + '%';

        return [
            SELECT Id, Name
            FROM Bear__c
            WHERE Name LIKE :key
            ORDER BY Name
        ];
    }
}
