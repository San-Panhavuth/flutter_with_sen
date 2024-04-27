<?php
include 'db.php'; // Ensure db.php sets up $link as mysqli connection object
    $todo = $_POST['text_todo'];

    $link->query("INSERT INTO todo_table (text_todo) VALUES ('$todo')");
?>