<?php
session_start();

include('includes/config.php');
error_reporting(0);

if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['add']))
{
$count_my_page = ("documentid.txt");
$hits = file($count_my_page);
$hits[0] ++;
$fp = fopen($count_my_page , "w");
fputs($fp , "$hits[0]");
fclose($fp); 
$DocId= $hits[0];
$title=$_POST['title'];
//$category=$_POST['category'];
$authorid=$_POST['authorid'];
$isbn=$_POST['isbn'];
$pdate=$_POST['pdate'];
$pubid=$_POST['pubid'];
$libid=$_POST['libid'];
$copies=$_POST['copies'];
$price=$_POST['price'];
$sql="INSERT INTO documents(DocId,Title,PubDate,PublisherId) VALUES(:DocId,:title,'2019-05-07',:pubid)";
//$sql="INSERT INTO documents(DocId,Title,AuthorId,ISBNNumber,PubDate,PublisherId,LibId) VALUES(:DocId,:title,:authorid,:isbn,:pdate,:pubid,:libid)";
$query = $dbh->prepare($sql);
$query->bindParam(':DocId',$DocId,PDO::PARAM_STR);
$query->bindParam(':title',$title,PDO::PARAM_STR);
$query->bindParam(':pubid',$pubid,PDO::PARAM_STR);
/*$query->bindParam(':category',$category,PDO::PARAM_STR);
$query->bindParam(':authorid',$authorid,PDO::PARAM_STR);
$query->bindParam(':isbn',$isbn,PDO::PARAM_STR);
$query->bindParam(':pdate',$pdate,PDO::PARAM_STR);

$query->bindParam(':libid',$libid,PDO::PARAM_STR);
$query->bindParam(':copies',$copies,PDO::PARAM_STR);
*/
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Book Listed successfully";
header('location:manage-books.php');
}
else 
{
header('location:manage-books.php');
}

}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Online Library Management System | Add Book</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
    <div class="content-wra
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Book</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Book Info
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Book Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="title" autocomplete="off"  required />
</div>


<div class="form-group">
<label> Author<span style="color:red;">*</span></label>
<select class="form-control" name="author" required="required">
<option value=""> Select Author</option>
<?php 

$sql = "SELECT * from authors ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->AuthorId);?>"><?php echo htmlentities($result->AuthorName);?></option>
 <?php }} ?> 
</select>
</div>

<div class="form-group">
<label>ISBN Number<span style="color:red;">*</span></label>
<input class="form-control" type="integer" name="isbn"  required="required" autocomplete="off"  />
<p class="help-block">An ISBN is an International Standard Book Number.ISBN Must be unique</p>
</div>

<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Publication Date<span style="color:red;">*</span></label>
<input class="form-control" type="date" name="pdate" required="required"  autocomplete="off" />
<!--
<input class="form-control" type="text" name="pdate" placeholder="YYYY-MM-DD"  required pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])/(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])/(?:30))|(?:(?:0[13578]|1[02])-31))" autocomplete="off" />
-->
</div>

<div class="form-group">
<label> Publisher<span style="color:red;">*</span></label>
<select class="form-control" name="pubid" required="required">
<option value=""> Select Publisher</option>
<?php 

$sql = "SELECT * from  publishers ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->PubId);?>"><?php echo htmlentities($result->PubName);?></option>
 <?php }} ?> 
</select>
</div>

<div class="form-group">
<label> Library<span style="color:red;">*</span></label>
<select class="form-control" name="libid" required="required">
<option value=""> Select Library</option>
<?php 

$sql = "SELECT * from  branch ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->LibId);?>"><?php echo htmlentities($result->LibName);?></option>
 <?php }} ?> 
</select>
</div>

<!--
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Number of copies<span style="color:red;">*</span></label>
<input class="form-control" type="integer" name="copies" autocomplete="off"  required />
</div>


 <div class="form-group">
 <label>Price<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="price" autocomplete="off"   required="required" />
 </div>
-->
<button type="submit" name="add" class="btn btn-danger">Add </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
