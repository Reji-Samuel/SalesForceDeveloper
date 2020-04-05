global class Response {
        
        //Declare Variables and Objects globally.
       
        public List<Account> accountData { get; set;}
        public List<Contact> contactData { get; set;}
       public String status {get; set;}
        public String message {get;set;}
        public String errorCode {get; set;}
        public list<case> casedata{set;get;}
        //Default Constructor of class Repsonse
        public Response(){
          
            status = '';
           
            accountData = new List<Account>();
           casedata = new list<case>();
            contactData = new List<Contact>();
           message = '';
            errorCode = '';  

           
        }
        
        //Parameterised Contructor of class Response
        public Response(String reason){
            //This gets called from class WSInvestorDashboard
            if(reason == 'InvestorDashboard')
            {            
                system.debug('InvestorDashboard');
                accountData = new List<Account>();
               
            }
            //This gets called from class WSInvestorReports
            if(reason == 'InvestorReports')
            {      
                system.debug('InvestorReports');
                accountData = new List<Account>();
               
            }
        
            
        }
        

  }