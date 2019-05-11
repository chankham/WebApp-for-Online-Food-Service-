<?php

	include_once 'dbh.inc.php';


	$first = $_POST['firstname'];
	$last = $_POST['lastname'];

	$sql = "DELETE FROM person 
			WHERE  fname = '$first' AND lname = '$last';";
	mysqli_query($conn,$sql);	

	header("Location: ../index.php?delete=success");
?>