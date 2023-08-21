const form=document.getElementById('signupform');
form.addEventListener('submit',e=>{
    let fname=form.elements['fname'].value;
    let lname=form.elements['lname'].value;
    let city=form.elements['city'].value;
    let phonenumber=form.elements['phonenumber'].value;
    let amount=form.elements['amount'].value
    let email=form.elements['emailid'].value;
    let pass=form.elements['password'].value;

    let check=false;
    if(fname==''){
        document.getElementById("fname1").innerHTML="Please Enter Valid First Name";
        check=true;
        
    }
    if(lname==''){
        document.getElementById("lname1").innerHTML="Please Enter Valid Last Name";
        check=true;

    }
    if(city==''){
        document.getElementById("city1").innerHTML="Please Enter Valid City Name";
        check=true;
    }

    if(phonenumber==''||phonenumber.length!=10){
        document.getElementById("phonenumber1").innerHTML="Please Enter Valid phone Number";
        check=true;
    }

    if(amount==''){
        document.getElementById("amount1").innerHTML="Please Enter Valid Amount in Ruppes";
        check=true;
    }
    
    if(email==''){
        document.getElementById("email1").innerHTML="Please Enter Valid email";
        check=true;
    }
    if(pass==''||pass.length<=6){
        document.getElementById("pass1").innerHTML="Please Enter Valid First password";
        check=true;
    }
    if(check==true){
        e.preventDefault();
    }
    
        
        

})