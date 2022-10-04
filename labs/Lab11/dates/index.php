<?php
//set default value
$message = '';

//set current timezone
date_default_timezone_set('America/Boise');

//get value from POST array
$action = filter_input(INPUT_POST, 'action');
if ($action === NULL) {
    $action =  'start_app';
}

//process
switch ($action) {
    case 'start_app':

        // set default invoice date 1 month prior to current date
        $interval = new DateInterval('P1M');
        $default_date = new DateTime();
        $default_date->sub($interval);
        $invoice_date_s = $default_date->format('n/j/Y');

        // set default due date 2 months after current date
        $interval = new DateInterval('P2M');
        $default_date = new DateTime();
        $default_date->add($interval);
        $due_date_s = $default_date->format('n/j/Y');

        $message = 'Enter two dates and click on the Submit button.';
        break;
    case 'process_data':
        $invoice_date_s = filter_input(INPUT_POST, 'invoice_date');
        $due_date_s = filter_input(INPUT_POST, 'due_date');

        // make sure the user enters both dates
        if ($invoice_date_s == null) {
            $message = 'Invoice Date is required';
            break;
        }

        if ($due_date_s == null) {
            $message = 'Due Date is required';
            break;
        }

        // convert date strings to DateTime objects
        // and use a try/catch to make sure the dates are valid
        try {
            $invoice_date = new DateTime($invoice_date_s);
            $due_date = new DateTime($due_date_s);
        } catch (Exception $errror) {
            $message = 'Error: '.$error;
        }

        // make sure the due date is after the invoice date
        if ($invoice_date > $due_date) {
            $message = 'Due Date cannot come before Invoice Date';
        }

        // format both dates
        $invoice_date_f = $invoice_date->format('n/j/Y');
        $due_date_f = $due_date->format('n/j/Y');;
        
        // get the current date and time and format it
        $today = new DateTime();
        $current_date_f = $today->format('n/j/Y');
        $current_time_f = $today->format('h:i:s');
        
        // get the amount of time between the current date and the due date
        // and format the due date message
        $date_diff = date_diff($due_date, $invoice_date);
        $due_date_message = $date_diff->format('%y years, %m months, %d days');

        break;
}
include 'date_tester.php';
?>