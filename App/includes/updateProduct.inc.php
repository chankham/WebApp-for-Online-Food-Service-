<?php

	include_once 'dbh.inc.php';


	$old = $_POST['oldName'];
	$new = $_POST['newName'];
	$des = $_POST['description'];
	$price = $_POST['prodPrice'];
	$image = $_POST['image'];
	$stock = $_POST['instock'];
	$catValue = $_POST['catNum'];

	$sql = "UPDATE product 
			SET product_name ='$new', description ='$des', product_price ='$price', image ='$image', instock='$stock', category_no = '$catValue' 
			WHERE product_name ='$old';";
	mysqli_query($conn,$sql);	

	header("Location: ../index.php?add_product=success");
?>