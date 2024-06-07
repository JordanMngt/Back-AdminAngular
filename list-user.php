<?php

include('header-init.php');
include('extraction-jwt.php');

if($utilisateur->role != 'Administrateur'){
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}

$requete = $db->query('SELECT u.id_user, u.email, u.firstname, u.lastname, r.name as role FROM utilisateur as u JOIN role as r ON u.id_role = r.iduser');

$utilisateurs = $requete->fetchAll();

echo json_encode($utilisateurs);