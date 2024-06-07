<?php

include('header-init.php');

// $toto = password_hash("root", PASSWORD_DEFAULT);

// echo password_verify("root", $toto) ? "oui": "non";

// echo $toto;
// exit();

$json = file_get_contents('php://input');

$utilisateur = json_decode($json);

$requete = $db->prepare("SELECT u.id_user, u.email, u.password, u.firstname, u.lastname, r.name as role FROM utilisateur AS u JOIN role AS r ON u.id_role = r.id_role WHERE u.email = :email");

$requete->bindValue("email", $utilisateur->email);
$requete->execute();
$utilisateurBdd = $requete->fetch();

// var_dump($utilisateurBdd);


// si l'utilisateur n'existe pas ou qu'il s'est trompé de mdp.
if(!$utilisateurBdd || !password_verify($utilisateur->password, $utilisateurBdd['password'])){
  echo '{"message":"Login ou mot de passe incorrect"}';
  http_response_code(403);
  exit();
}

$header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']); 

$payload = json_encode([ // va créer un json pour le payload
    'id' => $utilisateurBdd['id_user'],
    'role' => $utilisateurBdd['role'],
    'email' => $utilisateurBdd['email'],
    'firstname' => $utilisateurBdd['firstname'],
    'lastname' => $utilisateurBdd['lastname'],
]);

$base64UrlHeader = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header)); // Permet de traduire les caractères en base64 le header 
$base64UrlPayload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload)); // Pareil pour le payload

$signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, 'votre_cle_secrete', true);
$base64UrlSignature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature)); // La signature en base64

$jwt = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;
echo '{"jwt" : "' . $jwt . '"}';