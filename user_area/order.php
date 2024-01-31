<?php
    include('../includes/connect.php');
    include('../function/common_function.php');

    if(isset($_GET['user_id'])){
        $user_id=$_GET['user_id'];
    }

    $get_ip_address=getIPAddress();
    $total_price=0;
    $cart_query_price="select * from `cart_detail` where ip_address='$get_ip_address'";
    $result_cart_price=mysqli_query($con,$cart_query_price);
    $invoice_number=mt_rand();
    $status='pending';
    $count_product=mysqli_num_rows($result_cart_price);

    while($row_price=mysqli_fetch_array($result_cart_price)){
        $product_id=$row_price["product_id"];
        $select_product="select * from `products` where product_id=$product_id";
        $run_price=mysqli_query($con,$select_product);

        while($row_product_price=mysqli_fetch_array($run_price)){
            $product_price=array($row_product_price['product_price']);
            $product_value=array_sum($product_price);
            $total_price+=$product_value;

        }
    }

    // get qty from cart
    $get_cart="select * from `cart_detail`";
    $run_cart=mysqli_query($con,$get_cart);
    $get_item_quantity=mysqli_fetch_array($run_cart);
    $quantity=$get_item_quantity['quantity'];

    if($quantity==0){
        $quantity=1;
        $subtotal=$total_price;
    }else{
        $quantity=$quantity;
        $subtotal=$total_price*$quantity;
    }

    $insert_order="insert into `user_order` (user_id, amount_due, invoice_number, total_product, order_date, order_status) values ($user_id, $subtotal, $invoice_number, $count_product, NOW(), '$status')";
    $result_query=mysqli_query($con,$insert_order);

    if($result_query){
        echo "<script>alert('Order are submit successfully')</script>";
        echo "<script>window.open('profile.php','_self')</script>";

    }


    //order pending
    $insert_pending_order="insert into `order_pending` (user_id,invoice_number, product_id, quantity, order_status) values ($user_id, $invoice_number, $product_id, $quantity, '$status')";
    $result_pending=mysqli_query($con,$insert_pending_order);
    
    //delete item from cart
    $empyt="delete from `cart_detail` where ip_address='$get_ip_address'";
    $result_delete=mysqli_query($con,$empyt);
?>

