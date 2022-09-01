<!-- 
    Nicko Goodwin
    9/1/2022
 -->

<?php
require_once('database.php');

$category_id = filter_input(INPUT_POST, 'category_id', FILTER_VALIDATE_INT);

//delete
if ($category_id != FALSE) {
    $query = 'DELETE FROM categories 
        WHERE categoryID = :category_id';
    $statement = $db->prepare($query);
    $statement->bindValue(':category_id', $category_id);
    $success = $statement->execute();
    $statement->closeCursor();     
}

//display categories page
include('category_list.php');
?>