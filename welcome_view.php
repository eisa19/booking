<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            <img src="./images/books.svg" width="30" height="30" class="d-inline-block align-top" alt="">
            BookClub
        </a> 
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button> 
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">  
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="welcome.php">Home <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="listBooks.php">Books</a>
                    <a class="nav-link" href="#">Add a Book</a>
                    <a class="nav-link" href="#">Book Reviews</a>
                    <a class="nav-link" href="reset-password.php">Reset Password</a>
                    <a class="nav-link" href="logout.php">Logout</a>
            </div>
          </div>
    </nav>
    <div>
        <h3>Welcome To the BookClub</h3>
    </div>    
        <img src="./images/bookclub.png" width="600" height="600" class="align-top" alt="">
        <p>Now you must leave</p>

        <p> <a href="">Reset Password</a>.</p>
        <p> <a href="logout.php">Logout</a>.</p>
</div>   
</body>
</html>