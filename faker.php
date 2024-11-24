<?php

require_once 'vendor/autoload.php';

use Faker\Factory as Faker;
use PDO;

// Configuration de la base de données
$host = 'localhost';
$db = 'e-commerce';
$user = 'root';
$pass = '';
$charset = 'utf8mb4_unicode_ci';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int) $e->getCode());
}

$faker = Faker::create();

// Générer des utilisateurs
for ($i = 0; $i < 10; $i++) {
    $password = password_hash($faker->password, PASSWORD_BCRYPT);
    $sql = "INSERT INTO user (name, age, phone_number) VALUES (:name, :age, :phone_number)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['name' => $faker->name, 'age' => $faker->numberBetween(18, 65), 'phone_number' => $faker->phoneNumber]);
}

// Générer des adresses
for ($i = 0; $i < 10; $i++) {
    $sql = "INSERT INTO address (user_id, name_of_the_street, number_of_the_street, mailing_address) VALUES (:user_id, :name_of_the_street, :number_of_the_street, :mailing_address)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'user_id' => $faker->numberBetween(1, 10),
        'name_of_the_street' => $faker->streetName,
        'number_of_the_street' => $faker->buildingNumber,
        'mailing_address' => $faker->address
    ]);
}

// Générer des produits
for ($i = 0; $i < 20; $i++) {
    $sql = "INSERT INTO product (name, price) VALUES (:name, :price)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'name' => $faker->word,
        'price' => $faker->randomFloat(2, 10, 100)
    ]);
}

// Générer des commandes
for ($i = 0; $i < 10; $i++) {
    $sql = "INSERT INTO command (user_id, payment_with_card_delivery_or_withdrawal) VALUES (:user_id, :payment_with_card_delivery_or_withdrawal)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'user_id' => $faker->numberBetween(1, 10),
        'payment_with_card_delivery_or_withdrawal' => $faker->randomElement(['Card', 'Delivery', 'Withdrawal'])
    ]);
}

// Générer des paniers
for ($i = 0; $i < 10; $i++) {
    $sql = "INSERT INTO cart (user_id, command_id) VALUES (:user_id, :command_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'user_id' => $faker->numberBetween(1, 10),
        'command_id' => $faker->numberBetween(1, 10)
    ]);
}

// Générer des produits dans les paniers
for ($i = 0; $i < 20; $i++) {
    $sql = "INSERT INTO cart_products (cart_id, product_id) VALUES (:cart_id, :product_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'cart_id' => $faker->numberBetween(1, 10),
        'product_id' => $faker->numberBetween(1, 20)
    ]);
}

// Générer des factures
for ($i = 0; $i < 10; $i++) {
    $sql = "INSERT INTO invoices (command_id, items_already_order) VALUES (:command_id, :items_already_order)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'command_id' => $faker->numberBetween(1, 10),
        'items_already_order' => $faker->numberBetween(1, 5)
    ]);
}

echo "Données fictives générées avec succès !";
