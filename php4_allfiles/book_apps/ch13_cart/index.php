<?php
require_once('cart.php');

// Start session management
session_start();

// Create a cart array if needed
if (empty($_SESSION['cart13'])) { $_SESSION['cart13'] = []; }

// Create a table of products
$products = [
    'MMS-1754' => ['name' => 'Flute', 'cost' => '149.50'],
    'MMS-6289' => ['name' => 'Trumpet', 'cost' => '199.50'],
    'MMS-3408' => ['name' => 'Clarinet', 'cost' => '299.50'],
];

// Get the sort key
$sort_key = filter_input(INPUT_POST, 'sortkey');
if ($sort_key === NULL) {
    $sort_key = filter_input(INPUT_GET, 'sortkey');
    if ($sort_key === NULL) {
        $sort_key = 'name';
    }
}

// Get the action to perform
$action = filter_input(INPUT_POST, 'action');
if ($action === NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action === NULL) {
        $action = 'show_add_item';
    }
}

// Add or update cart as needed
switch($action) {
    case 'add':
        $key = filter_input(INPUT_POST, 'productkey');
        $quantity  = filter_input(INPUT_POST, 'itemqty');
        $product = $products[$key];
        cart\add_item($key, $quantity, $product);
        header('Location: .?action=show_cart');
        break;
    case 'update':
        $new_qty_list = filter_input(INPUT_POST, 'newqty', 
                FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
        foreach($new_qty_list as $key => $qty) {
            if ($_SESSION['cart13'][$key]['qty'] != $qty) {
                cart\update_item($key, $qty);
            }
        }
        header('Location: .?action=show_cart&sortkey='.$sort_key);
        break;
    case 'show_cart':
        cart\sort($sort_key);
        include('cart_view.php');
        break;
    case 'show_add_item':
        include('add_item_view.php');
        break;
    case 'empty_cart':
        unset($_SESSION['cart13']);
        include('cart_view.php');
        break;
}
?>