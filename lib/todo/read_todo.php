<?php
        include 'db.php';

        $query = $link->query("SELECT * FROM todo_table");
        $result = array();
    
        while ($rowData = $query->fetch_assoc()) {
            $result[] = $rowData;
        }
    
    
        echo json_encode($result);
?>