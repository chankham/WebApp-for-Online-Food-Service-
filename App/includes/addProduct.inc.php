<?php

	include_once 'dbh.inc.php';


	$ID = $_POST['prodID'];
	$name = $_POST['prodName'];
	$des = $_POST['description'];
	$price = $_POST['prodPrice'];
	$image = $_POST['image'];
	$stock = $_POST['instock'];
	$catValue = $_POST['catNum'];

	$sql = "INSERT INTO product (product_ID, product_name, description, product_price, image, instock, category_no)
		VALUES ('$ID', '$name', '$des', '$price', '$image', '$stock', '$catValue');";
	mysqli_query($conn,$sql);	

	header("Location: ../index.php?add_product=success");
?>