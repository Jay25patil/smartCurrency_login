pragma solidity ^0.4.4;


contract RegisterUsr{
    
    mapping (address => string) User;
    mapping (address => string) credential;
    mapping (address => string) log_in;
    mapping (address => string) usr;
    
    event LoginAttempt(address sender, string ethadress);
    event Register(address sender,string email);
    event Register1(address sender,string password);
    event username(address sender, string UserName);

    
    function RegisterUser(string email,string password) {
        User[msg.sender]=email;
        credential[msg.sender]=password;
        Register(msg.sender,email);
        Register1(msg.sender,password);
    }
    
    function StringCompareRegister(string _email,string _password)returns (bool) {
    
    bytes memory email = bytes(_email);
    bytes memory Register = bytes(User[msg.sender]);
    bytes memory password = bytes(_password);
    bytes memory Register1 = bytes(credential[msg.sender]);
    if (email.length != Register.length)
    return false;
    if (password.length != Register1.length)
    return false;
    for (uint i = 0; i < email.length; i ++)
    if (email[i]!= Register[i])
    return false;
    return true;
    }

    
    function CreateUser(string UserName){
        usr[msg.sender]=UserName;
        username(msg.sender,UserName);
        
    }
    
    
    
    function StringCompare(string _UserName)returns (bool) {
    
    bytes memory UserName = bytes(_UserName);
    bytes memory username = bytes(usr[msg.sender]);
    if (UserName.length != username.length)
    return false;
    for (uint i = 0; i < UserName.length; i ++)
    if (UserName[i]!= username[i])
    return false;
    return true;
    }

    function Login(string Ethadress){
       log_in[msg.sender]=Ethadress;
       LoginAttempt(msg.sender, Ethadress);
        
    }
    
    function StringCompareLogin(string _ethadress)returns (bool) {
    
    bytes memory Ethadress = bytes(_ethadress);
    bytes memory LoginAttempt = bytes(log_in[msg.sender]);
    if (Ethadress.length != LoginAttempt.length)
    return false;
    for (uint i = 0; i < Ethadress.length; i ++)
    if (Ethadress[i]!= LoginAttempt[i])
    return false;
    return true;
    }
   
    function CheckUser(address addrs)returns (string ethadress ){
        
        return log_in[addrs];
        
    }
}

