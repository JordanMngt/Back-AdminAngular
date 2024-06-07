<?php

include('header-init.php');
include('extraction-jwt.php');

if($utilisateur->role != ('Administrateur')){
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}

$idUtilisateurASupp = $_GET['id'];

$requete = $db->prepare("DELETE FROM utilisateur WHERE id = :id");

$requete->bindValue('id', $idUtilisateurASupp);

$requete->execute();

echo '{"message" : "L\'utilisateur a bien été supprimé"}';


