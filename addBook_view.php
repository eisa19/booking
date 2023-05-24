<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add a Book</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
        <style>
            .wrapper{ width: 400px; padding: 20px; }
        </style>
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
                    <a class="nav-link" href="addBook.php">Add a Book</a>
                    <a class="nav-link" href="#">Book Reviews</a>
                    <a class="nav-link" href="logout.php">Logout</a>
            </div>
            </div>
        </nav>
        <div class="container justify-content-center mt-5">
            <h3>Add a Book</h3>
            <p>Please fill this form to add a book.</p>
            <form id='addBook' action='addBook.php' method="post">
                <div class="form-group mt-5">
                    <label>Book Title</label>
                    <input type="text" name="bookTitle" class="form-control <?php echo (!empty($bookTitle_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $bookTitle; ?>">
                    <span class="invalid-feedback"><?php echo $bookTitle_err; ?></span>
                </div>    
                <div class="form-group">
                    <label>Author FirstName</label>
                    <input type="text" name="authorFirstname" class="form-control <?php echo (!empty($authorFirstname_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $authorFirstname; ?>">
                    <span class="invalid-feedback"><?php echo $authorFirstname_err; ?></span>
                </div>
                <div class="form-group">
                    <label>Author LastName</label>
                    <input type="text" name="authorLastname" class="form-control <?php echo (!empty($authorLastname_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $authorLastname; ?>">
                    <span class="invalid-feedback"><?php echo $authorLastname_err; ?></span>
                </div>
                <div class="form-group">
                    <label>Select Publish Year</label>
                    <input type="text" name="publishedYear" class="date-own form-control <?php echo (!empty($publishedYear_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $publishedYear; ?>">
                    <span class="invalid-feedback"><?php echo $publishedYear_err; ?></span>
                </div>
                <div class="form-group mt-5">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Add Book">
                    <input type="reset" class="btn btn-secondary btn-lg btn-block" value="Reset">
                </div>
            </form>
        </div>
        <script type="text/javascript">
            $('.date-own').datepicker({
                minViewMode: 2,
                format: 'yyyy'
            });
        </script>  
    </body>
</html>