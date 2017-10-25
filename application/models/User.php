<?php
class User extends CI_Model
{
    function login($username, $password)
    {
        //Monta query do SELECT
        $this -> db -> select('id_func, username, password');
        $this -> db -> from('usuario');
        $this -> db -> where('username', $username);
        $this -> db -> where('password', $password);
        $this -> db -> limit(1);
        
        //Executa query
        $query = $this -> db -> get();
      
        //Verifica se query retornou informações do BD
        if($query -> num_rows() == 1)
        //if($user == 'rprad1' && $password == '123')
        {
          return $query->result();
          //return true;
        }
        else
        {
          return false;
        }
    }
}
