<?php
$lifetime = 60 * 60 * 24 * 365;    // 1 Years in seconds
session_set_cookie_params($lifetime, '/');
session_start();

$_SESSION['tasks'] = !isset($_SESSION['tasks']) ? [] : $_SESSION['tasks'];

// $task_list = filter_input(INPUT_POST, 'tasklist', FILTER_DEFAULT, 
//         FILTER_REQUIRE_ARRAY);
// if ($task_list === NULL) {
//     $task_list = [];
// }
$action = filter_input(INPUT_POST, 'action');
$errors = [];

switch( $action ) {
    case 'add':
        $new_task = filter_input(INPUT_POST, 'newtask');
        if (empty($new_task)) {
            $errors[] = 'The new task cannot be empty.';
        } else {
            $_SESSION['tasks'][] = $new_task;
        }
        break;
    case 'delete':
        $task_index = filter_input(INPUT_POST, 'taskid', FILTER_VALIDATE_INT);
        if ($task_index === NULL || $task_index === FALSE) {
            $errors[] = 'The task cannot be deleted.';
        } else {
            unset($_SESSION['tasks'][$task_index]);
        }
        break;
}

include('task_list.php');
?>