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

// include_once "Books_model.php";

//       $database = new Database();
//       $db = $database->getConnection();
      
//       $booksModel = new Books($db);
//       $bookslist = $booksModel->getAllBooks();	 

public function getAllBooks() {

      $sql = "SELECT * FROM Books";
                        
      $stmt = $pdo->query($sql);

      $books = $stmt->fetchAll(PDO::FETCH_ASSOC);

      foreach ($books as $book) {
      print <<<_CAT
        <tr><td>$book[bookID]</td>
        <td>$book[bookTitle]</td>
        <td>$book[authorFirstname]</td>
        <td>$book[authorLastname]</td>
        <td>$book[publishedYear]</td>
        <td>$book[memberID]</td>
        <td>$book[bookBorrowed]</td></tr>
      _CAT;
}

include "listBooks_view.php";
?>
