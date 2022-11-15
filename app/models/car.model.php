<?php

class CarModel {
    private $db;
    
    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_taller_mecanico;charset=utf8mb4', 'root', '');
    }


    public function getAll($sort, $order, $limit, $page, $filterOwner) {
         
        $query_sentence = "SELECT * FROM `auto` ";
        
        if(!empty($filterOwner)){
            $query_sentence .= "WHERE `duenio` LIKE '%$filterOwner%'";
        }

        if(!empty($sort) && !empty($order)){
            $query_sentence .= " ORDER BY $sort $order";
        }

        if(!empty($limit)){
            $offset = $page * $limit - $limit;
            $query_sentence .= " LIMIT  $limit OFFSET $offset";
        }

        $query = $this->db->prepare($query_sentence);
        $query->execute();
        $cars = $query->fetchAll(PDO::FETCH_OBJ); 
        return $cars;
    }


    public function get($id) {
        $query = $this->db->prepare("SELECT * FROM `auto` WHERE id_auto = ?");
        $query->execute([$id]);

        $car = $query->fetch(PDO::FETCH_OBJ);
        return $car;
    }


    public function delete($id) {
        $query = $this->db->prepare('DELETE FROM `auto` WHERE id_auto = ?');
        $query->execute([$id]);
    }

    public function insert($patent, $owner, $model) {
        $query = $this->db->prepare("INSERT INTO `auto` (patente, duenio, modelo) VALUES (?, ?, ?)");
        $query->execute([$patent, $owner, $model]);

        return $this->db->lastInsertId();
    }
    
    public function update($id, $patent, $owner, $model) {
        $query = $this->db->prepare("UPDATE `auto` SET patente = ? , duenio = ?, modelo = ? 
                                    WHERE id_auto = ? ");
        $query->execute([$patent,$owner,$model,$id]);

        return $id;
    }

}   

