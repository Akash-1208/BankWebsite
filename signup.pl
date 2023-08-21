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
my $sth=$dbh->prepare("SELECT * FROM customers");
$sth->execute() or die $DBI::errstr;
my $id=$sth->rows;
$id=$id+1;
$sth->finish();
my $fname=param('fname');
my $lname=param('lname');
my $city=param('city');
my $phonenumber=param('phonenumber');
my $amount1=param('amount');
my $emailid=param('emailid');
my $Password=param('password');



$sth=$dbh->prepare("INSERT INTO customers(id,firstname,lastname,city,phonenumber,emailid,password) VALUES (?,?,?,?,?,?,?)" );
$sth->execute($id,$fname,$lname,$city,$phonenumber,$emailid,$Password) or die $DBI::errstr;
$sth->finish();

my $loans=0;
$sth=$dbh->prepare("INSERT INTO accounts(id,amount,loans) VALUES(?,?,?)");
$sth->execute($id,$amount1,$loans);
$sth->finish();

my $cgi=new CGI;
#print $cgi->header,

$cgi->start_html,
   print  "<h1> Hello Customer</h1>";
   print "<p>Please <a href='login.html'>Click Here</a> To go back to login page</p>";

$cgi->end_html;

