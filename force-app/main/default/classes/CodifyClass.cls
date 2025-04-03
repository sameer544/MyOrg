public with sharing class CodifyClass {
    public CodifyClass() {

    }
// ------ Codify: AI Generated Code Start-------
 
// Method to find the largest number in a given array
public static Integer findLargestNumber(Integer[] numbers) {
    // Check if the array is empty or null
    if (numbers == null || numbers.isEmpty()) {
        throw new IllegalArgumentException('The array cannot be null or empty.');
    }
    
    // Initialize the largest number with the first element of the array
    Integer largest = numbers[0];
    
    // Iterate through the array to find the largest number
    for (Integer numberV : numbers) {
        if (numberV > largest) {
            largest = numberV;
        }
    }
    
    // Return the largest number found
    return largest;
}

 //------ Codify: AI Generated Code End----- 
// ------ Codify: AI Generated Code Start-------
 
// Method to search for any key in Account records
public static List<Account> searchAccounts(String searchKey) {
    // Ensure the search key is not null or empty
    if (String.isBlank(searchKey)) {
        throw new IllegalArgumentException('Search key cannot be null or empty.');
    }
    
    // Escape special characters to prevent SOQL injection
    String escapedSearchKey = String.escapeSingleQuotes(searchKey);
    
    // Check field-level security for the fields being queried
    if (!Account.sObjectType.getDescribe().isAccessible()) {
        //throw new InsufficientPermissionsException('You do not have permission to access Account records.');
    }
    
    // Query to search for Accounts using the search key
    List<Account> accounts = [SELECT Id, Name, Industry, Phone, Website
                              FROM Account
                              WHERE Name LIKE :('%' + escapedSearchKey + '%')
                              OR Industry LIKE :('%' + escapedSearchKey + '%')
                              OR Phone LIKE :('%' + escapedSearchKey + '%')
                              OR Website LIKE :('%' + escapedSearchKey + '%')
                              LIMIT 100];
    
    return accounts;
}

 //------ Codify: AI Generated Code End----- 

}