<?php

include('header-init.php');
include('extraction-jwt.php');

if($utilisateur->role != ('Administrateur')){
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}


if(!isset($_GET['id'])) {
    http_response_code(400);
    echo '{"message" : "il manque l\'identifiant dans l\'url"}';
    exit();
}

$idUser = $_GET['id'];

$requete = $db->prepare('SELECT u.id_user, u.email, u.firstname, u.lastname, r.name AS role  FROM utilisateur as u JOIN role as r ON u.id_role = r.id_user WHERE u.id = :id');

$requete->bindValue('id', $idUser);

$requete->execute();

$utilisateur = $requete->fetch();

if (!$utilisateur) {
    http_response_code(404);
    echo '{"message" : "utilisateur introuvable"}';
    exit();
}

echo json_encode($utilisateur);