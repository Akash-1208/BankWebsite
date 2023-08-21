#!C:\xampp\perl\bin\perl.exe
use warnings;
use DBI;
use CGI':standard';
print "content-type:text/html \n\n";

my $driver="mysql";
my $database="customers";
my $dsn="DBI:$driver:database=$database";
my $userid="akash";
my $password="akash";


my $dbh=DBI->connect($dsn,$userid,$password) or die $DBI::errstr;

my $emailid=param('emailid');
my $Password=param('password');

my $cgi=new CGI;
my $sth=$dbh->prepare("SELECT * FROM customers WHERE emailid=? AND password=?");
$sth->execute($emailid,$Password) or die $DBI::errstr;
while(my @row=$sth->fetchrow_array()){
    my $row_count=$sth->rows;
    my($id,$firstname,$lastname)=@row;
    my $sth=$dbh->prepare("SELECT amount ,loans,firstname FROM accounts LEFT JOIN customers on accounts.id=customers.id WHERE accounts.id=$id");
    $sth->execute() or die $DBI::errstr;
    my $temp;
    my $temp1;
    while(my @row=$sth->fetchrow_array()){
        my($amount,$loans,$fname)=@row;
        $temp=$amount;
        $temp1=$loans;
    }


    if($row_count==1){
   $cgi->start_html,
   print "<link rel='stylesheet' href='css/loggedin.css'>";
   print "<div class='header'>
        <div  class='header_left'>
        <h1 >The Bank</h1>
        </div>
        <div class='header_right'>
         <p> Hello, $firstname $lastname</p>
    </div>
    </div>";


    print "<div class='balance'>
            <div class='checkbalance'>
                <figure>
                    <img src='images/OIP.jpg'>
                    <figcaption>Your Balance Is: $temp Rs/-</figcaption>
                </figure>
            </div>
            <div class='checkbalance'>
                <figure>
                    <img class='loan' src='images/loan.jpg'>
                    <figcaption>Your have $temp1 Loans</figcaption>
                </figure>
            </div>
            <div class='checkbalance'>
                <figure>
                    <img src='images/image1.png'>
                    <figcaption><form method='get' action='bank.doc'>
                    <button type='submit'>Download Broucher!</button>
                    </form></figcaption>
                </figure>
            </div>
        </div>";


     
    $cgi->end_html;

    }
    else{
        # exit();
    }

}

$sth->finish();


