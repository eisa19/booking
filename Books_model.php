<?php
    class Books{

        // Connection
        private $conn;
		
        // Table
        private $db_table = "Books";

        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        
        // list all Books
        public function getAllBooks() {

        	$sql = 'SELECT * FROM Books';
        		
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            //var_dump($result);
            return $result;
        }
        
    }
?>