<?php

include('header-init.php');
include('extraction-jwt.php');

if($utilisateur->role != ('Admin')){
    http_response_code(403);
    echo '{"message" : "Vous n\'avez pas les droits nécessaires"}';
    exit();
}

$json = file_get_contents('php://input');

$utilisateur = json_decode($json);

$requete = $db->prepare("SELECT id FROM role WHERE name = :name");
$requete->bindValue("name", $utilisateur->role);
$requete->execute();
$role = $requete->fetch();

if(!$role)
{
  http_responde_code(400);
  echo '{"message" : "ce role n\'existe pas"}';
  exit();
}

if(!isset($_GET['id'])){
  http_responde_code(400);
  echo '{"message" : "Il manque l\'identifiant de l\'utilisateur à modifier"}';
  exit();
}

$requete = $db->prepare("SELECT * FROM utilisateur WHERE id = :id");
$requete->bindValue("id", $_GET['id']);
$requete->execute();
$utilisateurBdd = $requete->execute();


if(!$utilisateurBdd){
  http_responde_code(400);
  echo '{"message" : "Il manque l\'identifiant de l\'utilisateur n\'existe pas / plus"}';
  exit();
}

if($utilisateur->password == ''){
  $utilisateur-> password = $utilisateurBdd['password'];

} else {
  $utilisateur->password = password_hash($utilisateur->password, PASSWORD_DEFAULT);
}

$requete = $db->prepare("UPDATE utilisateur SET email = :email, password = :password, firstname = :firstname, lastname = :lastname, id_role = :id_role WHERE id = :id");

$requete->bindValue("email", $utilisateur->email);
$requete->bindValue("password", $utilisateur->password);
$requete->bindValue("firstname", $utilisateur->firstname);
$requete->bindValue("lastname", $utilisateur->lastname);
$requete->bindValue("id_role", $role['id']);
$requete->bindValue("id", $_GET['id']);
$requete->execute();

echo '{"message" : "modification réussie"}';