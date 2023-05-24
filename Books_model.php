<?php
    class Books{

        // list all Books
        public function getAllBooks() {

            // Include config file
            require_once "config.php";

        	$sql = "SELECT * FROM Books";
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $result;
        }
        
    }
?>