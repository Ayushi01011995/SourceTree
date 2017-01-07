@RestResource(urlMapping='/Issue/*')
global with sharing class CreateIssue {
    
    @HttpPost
    global static string createCase(string status, String description, String email, String Origin, String subject)
    {
        
        try{
            Case cs = new Case(Status= status, Description = description,SuppliedEmail =  email, Origin = Origin, Subject = subject);
            insert cs;
        }catch(Exception e){
            System.debug('Exception '+e);
        }
        System.debug('issue created');
        return 'Success';
    }
    @Httpget
 global static List<Case> getCase(){
  return [select id,Status from Case LIMIT 5];
 }
    
}