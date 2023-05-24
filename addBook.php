<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$bookTitle = $authorFirstname = $authorLastname = $publishedYear = "";
$memberID = $_SESSION["memberID"];
$bookBorrowed = 0;
$bookTitle_err = $authorFirstname_err = $authorLastname_err = $publishedYear_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate bookTitle
    if(empty(trim($_POST["bookTitle"])) || empty(trim($_POST["authorFirstname"]))
        || empty(trim($_POST["authorLastname"])) || empty(trim($_POST["publishedYear"]))) {
        $bookTitle_err = "Please enter a bookTitle.";
        $authorFirstname_err = "Please enter a authorFirstname.";
        $authorLastname_err = "Please enter a authorLastname.";
        $publishedYear_err = "Please enter a publishedYear.";
    } else {
        // Get Parameters value
        $bookTitle = $_POST["bookTitle"]?? trim($_POST["bookTitle"]);
        $authorFirstname = $_POST["authorFirstname"]?? trim($_POST["authorFirstname"]);
        $authorLastname = $_POST["authorLastname"]?? trim($_POST["authorLastname"]);
        $publishedYear = $_POST["publishedYear"]?? trim($_POST["publishedYear"]);
    }
    
    // Check input errors before inserting in database
    if(empty($bookTitle_err) && empty($authorFirstname_err) && empty($authorLastname_err) && empty($publishedYear_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO Books (bookTitle, authorFirstname, authorLastname, publishedYear, Members_memberID, bookBorrowed) VALUES (:bookTitle, :authorFirstname, :authorLastname, :publishedYear, :Members_memberID, :bookBorrowed)";
         
        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(":bookTitle", $param_bookTitle, PDO::PARAM_STR);
            $stmt->bindParam(":authorFirstname", $param_authorFirstname, PDO::PARAM_STR);
            $stmt->bindParam(":authorLastname", $param_authorLastname, PDO::PARAM_STR);
            $stmt->bindParam(":publishedYear", $param_publishedYear, PDO::PARAM_STR);
            $stmt->bindParam(":Members_memberID", $param_Members_memberID, PDO::PARAM_STR);
            $stmt->bindParam(":bookBorrowed", $param_bookBorrowed, PDO::PARAM_STR);
            
            // Set parameters
            $param_bookTitle = $bookTitle;
            $param_authorFirstname = $authorFirstname;
            $param_authorLastname = $authorLastname;
            $param_publishedYear = $publishedYear;
            $param_Members_memberID = $memberID;
            $param_bookBorrowed = $bookBorrowed;
            
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Redirect to Books page
                header("location: listBooks.php");
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            unset($stmt);
        }
    }
    
    // Close connection
    unset($pdo);
}

include "addBook_view.php";
?>
 