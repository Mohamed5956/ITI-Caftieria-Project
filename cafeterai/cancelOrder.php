<?php

include '../controls/database.php';
session_start();

if (!isset($_SESSION['user'])) {
	header('location:../controls/login.php');
}

$date = filter_input(INPUT_GET, 'date', FILTER_SANITIZE_NUMBER_INT);
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
$amount = filter_input(INPUT_GET, 'amount', FILTER_SANITIZE_NUMBER_INT);
$totalamount=0;

/////////////////////////////////

$queryselect = " select amount from products WHERE products.id=(SELECT orders.product_id FROM orders WHERE orders.order_id=:id)";
$stmtselect = $db->prepare($queryselect);
$stmtselect->bindValue(":id", $id);
$ress = $stmtselect->execute();

while($row=$stmtselect->fetch(PDO::FETCH_ASSOC)){

$totalamount=$row['amount'] + $amount;
}
// var_dump($row);
// exit;
////////////////////////////////////////////////
$queryupdate= "UPDATE products SET amount=:totalamount WHERE products.id=(SELECT orders.product_id FROM orders WHERE orders.order_id=:id)";
$stmtupdate = $db->prepare($queryupdate);
$stmtupdate->bindValue(":totalamount", $totalamount);
$stmtupdate->bindValue(":id", $id);
$rbol = $stmtupdate->execute();

//////////////////////////
$query = "DELETE FROM `orders` WHERE `date`=:date";
$stmt = $db->prepare($query);
$stmt->bindValue(":date", $date);
$res=$stmt->execute();

if($stmt->rowCount()){
    
    header('Location:myorder.php');
}
