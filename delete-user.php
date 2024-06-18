<?php

include('header-init.php');
include('extraction-jwt.php');

if($utilisateur->role != ('Admin')){
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}

$idUtilisateurASupp = $_GET['id'];

$requete = $db->prepare("DELETE FROM utilisateur WHERE id_user = :id_user");

$requete->bindValue('id_user', $idUtilisateurASupp);

$requete->execute();

echo '{"message" : "L\'utilisateur a bien été supprimé"}';


