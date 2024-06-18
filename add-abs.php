<?php

include('header-init.php');
include('extraction-jwt.php');

if ($utilisateur->role != 'Admin') {
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}

$json = file_get_contents('php://input');
$data = json_decode($json);

$requete = $db->prepare("INSERT INTO absence (absence_date) VALUES (:absence_date)");
$requete->bindValue(":absence_date", $data->abs);
$requete->execute();

echo '{"message" : "Absence ajoutée avec succès"}';
?>
