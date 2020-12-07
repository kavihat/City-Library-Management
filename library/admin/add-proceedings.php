<?php
session_start();
error_reporting(0);
include('includes/config.php');
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
$editorid=$_POST['editorid'];
//$date=$_POST['date'];
$location=$_POST['location'];
$pdate=$_POST['pdate'];
$pubid=$_POST['pubid'];
$libid=$_POST['libid'];
//$copies=$_POST['copies'];
$sql="INSERT INTO documents(DocId,Title,PubDate,PublisherId) VALUES(:DocId,:title,'2019-05-07',:pubid)";
//$sql="INSERT INTO proceedings(DocId,Title,CEditorId,CLocation,PubDate,PublisherId,LibId) VALUES(:DocId,:title,:editorid,:location,:pdate,:pubid,:libid)";
$query = $dbh->prepare($sql);
$query->bindParam(':DocId',$DocId,PDO::PARAM_STR);
$query->bindParam(':title',$title,PDO::PARAM_STR);
//$query->bindParam(':editorid',$editorid,PDO::PARAM_STR);
//$query->bindParam(':date',$date,PDO::PARAM_STR);
//$query->bindParam(':location',$location,PDO::PARAM_STR);
//$query->bindParam(':pdate',$pdate,PDO::PARAM_STR);
$query->bindParam(':pubid',$pubid,PDO::PARAM_STR);
//$query->bindParam(':libid',$libid,PDO::PARAM_STR);
//$query->bindParam(':copies',$copies,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Proceedings Listed successfully";
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
    <title>Online Library Management System | Add Proceedings</title>
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
                <h4 class="header-line">Add Proceedings</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Proceedings Info
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Proceedings Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="title" autocomplete="off"  required />
</div>



<div class="form-group">
<label> Editor<span style="color:red;">*</span></label>
<select class="form-control" name="editorid" required="required">
<option value=""> Select Editor</option>
<?php 

$sql = "SELECT * from confeditors ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->CEditorId);?>"><?php echo htmlentities($result->CEditorName);?></option>
 <?php }} ?> 
</select>
</div>


 <div class="form-group">
 <label>Location<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="location" autocomplete="off"   required="required" />
 </div>
 
 <div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Publication Date<span style="color:red;">*</span></label>
<input class="form-control" type="date" name="pdate" autocomplete="off"  required />
</div>

<div class="form-group">
<label> Publisher<span style="color:red;">*</span></label>
<select class="form-control" name="pubid" required="required">
<option value=""> Select Publisher</option>
<?php 

$sql = "SELECT * from publishers";
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
<option value=""> Select Branch</option>
<?php 

$sql = "SELECT * from branch";
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
 
 
<button type="submit" name="add" class="btn btn-info">Add </button>

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
