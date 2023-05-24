<!DOCTYPE html>
<html>
  <head>
    <title>Books</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="generator" content="BBEdit 14.0" />
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
    <div class="container mt-5">
      <!-- Content here -->
      <table class="table">
        <th style="text-align:left">ID</th>
        <th style="text-align:left">Title</th>
        <th style="text-align:left">Author First Name</th>
        <th style="text-align:left">Author Last Name</th>
        <th style="text-align:left">Year Published</th>
        <th style="text-align:left">Member ID</th>
        <th style="text-align:left">Book Borrowed</th>

        <?php
          foreach ($bookslist as $book) {
            print <<<_CAT
              <tr><td>$book[bookID]</td>
              <td>$book[bookTitle]</td>
              <td>$book[authorFirstname]</td>
              <td>$book[authorLastname]</td>
              <td>$book[publishedYear]</td>
              <td>$book[Members_memberID]</td>
              <td>$book[bookBorrowed]</td></tr>
            _CAT;
          }
        ?>
      </table>
    </div>
  </body>
</html>

