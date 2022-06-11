trigger recursive_trigger1 on Contact (after update) {
    Account acc=[select Id,Name from Account][0];
    acc.Name='sameer';
    update acc;
}