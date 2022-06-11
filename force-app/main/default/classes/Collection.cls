public with sharing class Collection {
  //UserInformationTable UserTable=new UserInformationTable();
  public List<UserInformationTable> AddData(){
      List<UserInformationTable> data1=new List<UserInformationTable>();
      UserInformationTable ob=new UserInformationTable();
      ob.Id=1;
      ob.LastName='sameer';
      ob.FirstName='ranjan';
      ob.UserName='Sameerranjan544@gmail.com';
      data1.Add(ob);
      ob=new UserInformationTable();
      ob.Id=2;
      ob.LastName='sameer';
      ob.FirstName='ranjan';
      ob.UserName='Sameerranjan544@gmail.com';
       data1.Add(ob);
      return data1;
  }
}