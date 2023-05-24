<?php

// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

// Include Books Model file
include_once "Books_model.php";

$booksModel = new Books();
$bookslist = $booksModel->getAllBooks();

include "listBooks_view.php";
?>