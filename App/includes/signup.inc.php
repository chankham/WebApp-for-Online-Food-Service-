<?php

	include_once 'dbh.inc.php';


	$first = $_POST['firstname'];
	$last = $_POST['lastname'];
	$phone = $_POST['phone'];
	$email = $_POST['email'];
	$address = $_POST['address'];
	$user = $_POST['username'];
	$password = $_POST['pw'];

	$sql = "INSERT INTO person (fname, lname, phone_no, email, address)
		VALUES ('$first', '$last', '$phone', '$email', '$address');";
	mysqli_query($conn,$sql);	
		
	$sql2 = "INSERT INTO customer (user_name, password)
		VALUES ('$user', '$password');";
	
	mysqli_query($conn,$sql2);

	header("Location: ../index.php?signup=success");
?>