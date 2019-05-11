<?php

	include_once 'dbh.inc.php';
	session_start();
	//session_destroy();
	function display_cart()
	{
		global $conn;

		$sql = "SELECT product_ID, product_name, description, product_price, image, instock 
				FROM product 
				WHERE instock > 0;";

		$result = mysqli_query($conn, $sql);
		$num = mysqli_num_rows($result);


		while($fetch = mysqli_fetch_assoc($result))
		{
			echo '<img src="images/'.$fetch['image'].'" width="40" height="40" /><br />'.$fetch['product_name'].'<br />'.$fetch['description'].'<br /> $'.$fetch['product_price'].'<br /><a href="cart.php?add='.$fetch['product_ID'].'">Add to Cart</a>'.'<br />'.'<br />';
		}		
	}

	if(isset($_GET['add']) && !empty($_GET['add']))	
	{
		$id = $_GET['add'];
		$sql = "SELECT product_ID, instock
				FROM product
				WHERE product_ID = '$id';";
		$result = mysqli_query($conn, $sql);
		
		while($stock = mysqli_fetch_assoc($result))
		{
			if($stock['instock'] != @$_SESSION['cart_'.$id])
			{
				echo @$_SESSION['cart_'.$id]+=1;	
			}
			header('Location:cart.php');
		}	
	}

	if (isset($_GET['remove']))
	{
		$_SESSION['cart_'.$_GET['remove']]--;
		header('Location:cart.php');
	}

	if (isset($_GET['delete']))
	{
		$_SESSION['cart_'.$_GET['delete']]=0;
		header('Location:cart.php');
	}


	function calculate_total()
	{
		global $conn;
		$net_payment = 0;
		foreach($_SESSION as $name => $value)
		{
				if($value > 0)
				{
					if(substr($name,0,5) == 'cart_')
					{
					  //error_reporting(E_ERROR | E_PARSE);
					  $id = substr($name,5,(strlen($name)-5));
					  //echo $id;

					  $sql = "SELECT product_ID, product_name, product_price
					  		  FROM product
					  		  WHERE product_ID = '$id';";
					  $result = mysqli_query($conn, $sql);
					  //echo $result;
					  while($get = mysqli_fetch_assoc($result))
					  {

					  	$total = $value * $get['product_price'];
					  	//echo $id;
					  	echo $get['product_name'].' ('.$value.')'.' x '.$get['product_price'].' = $ '.$total.
					  	'<a href="cart.php?add='.$id.'"> [+] </a>
					  	 <a href="cart.php?remove='.$id.'"> [-] </a>
					  	 <a href="cart.php?delete='.$id.'"> [delete] </a>'.'<br>'.'<br>';
					  }		  
					}

					$net_payment+=$total;

				}			
		}

		if($net_payment == 0)
		{
			echo "No item in your cart";
		}
		else
		{
			echo "Your total is $".$net_payment.'<br>';
		}
	}


?>