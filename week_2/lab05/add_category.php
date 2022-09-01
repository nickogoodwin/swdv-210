<!-- 
    Nicko Goodwin
    9/1/2022
 -->

<?php
$name = filter_input(INPUT_POST, 'name');

if ($name != FALSE && $name != NULL) {
    require_once('database.php');

    $query = 'INSERT INTO categories (categoryName) VALUES (:name)';
    $statement = $db->prepare($query);
    $statement->bindValue(':name', $name);
    $statement->execute();
    $statement->closeCursor();

    include('category_list.php');
} else {
    $error = "Invalid category data. Check all fields and try again";
    include('error.php');
};
?>