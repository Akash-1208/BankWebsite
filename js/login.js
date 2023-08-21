console.log("Hello World");
const form=document.getElementById('myform');
form.addEventListener('submit',e=>{
let emailid=form.elements['emailid'].value;
let password=form.elements['password'].value;
console.log(emailid);
console.log(password);

let check=false;
    if(emailid==''){
        document.getElementById("alert_email").innerHTML="Please Enter Valid Email ";
        check=true;
        
    }
    if(password==''){
        document.getElementById("alert_password").innerHTML="Please Enter Valid Password";
        check=true;

    }
    if(check==true){
        e.preventDefault();
    }
    
// if(emailid=='' && password==''){
    
//     document.getElementById("alert_email").innerHTML="Please Enter Valid Email";
//     document.getElementById('alert_password').innerHTML="Please Enter Valid Password";
//     e.preventDefault();
    
    

})
