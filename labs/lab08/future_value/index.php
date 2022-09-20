<!-- 
    Nicko Goodwin
    9/20/2022
 -->
<?php 
    //set default value of variables for initial page load
    if (!isset($investment)) { $investment = '10000'; } 
    if (!isset($interest_rate)) { $interest_rate = '5'; } 
    if (!isset($years)) { $years = '5'; } 
?>
<!DOCTYPE html>
<html>
<head>
    <title>Future Value Calculator</title>
    <link rel="stylesheet" href="main.css"/>
</head>

<body>
    <main>
    <h1>Future Value Calculator</h1>
    <?php if (!empty($error_message)) { ?>
        <p class="error"><?php echo $error_message; ?></p>
    <?php } // end if ?>
    <form action="display_results.php" method="post">

        <div id="data">
            <label>Investment Amount:</label>
            <select name="investment">
                <?php for ($i = 10000.00; $i <= 50000.00; $i += 5000.00) { ?>
                    <option value="<?php echo $i?>"><?php echo '$'.number_format($i,2) ?></option>
                <?php }; ?>
            </select><br>

            <label>Yearly Interest Rate:</label>
            <select name="interest_rate">
                <?php for ($i = 4.0; $i <= 12.0; $i += 0.5) { ?>
                    <option value="<?php echo $i ?>"><?php echo number_format($i,1).'%' ?></option>
                <?php }; ?>
            </select><br>
        

            <label>Number of Years:</label>
            <select name="years">
                <?php for ($i = 1; $i <= 30; $i += 1) { ?>
                    <option value="<?php echo $i?>"><?php echo $i ?></option>
                <?php }; ?>
            </select><br>
        </div>

        <div id="buttons">
            <label>&nbsp;</label>
            <input type="submit" value="Calculate"/><br>
        </div>

    </form>
    </main>
    <style>
        select {
            width: 100px;
        }
    </style>
</body>
</html>