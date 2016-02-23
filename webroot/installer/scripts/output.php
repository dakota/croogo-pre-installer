<?php

function output ($result)
{
    header('Content-Type: application/json');
    echo json_encode($result);
}
