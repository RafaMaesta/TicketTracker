<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Check_Login extends CI_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->model('user','',TRUE);
    }
	public function index()
	{

        //Importa lib Validação
        $this->load->library('form_validation');
      
        //$this->form_validation->set_rules('txtLogin', 'Username', 'trim|required|xss_clean');
        //$this->form_validation->set_rules('txtSenha', 'Password', 'trim|required|xss_clean|check_database');
        $password = $this->input->post("txtSenha");
        if($this->check_database($password) == false)
        {
          //Field validation failed.  User redirected to login page
          $this->load->view('login_view');
          
        }
        else
        {
          //Go to private area
          redirect('Home', 'refresh');
        }


		
    }
    
    function check_database($password)
    {
      //Field validation succeeded.  Validate against database
      //Pega variavel da tela
      $username = $this->input->post('txtLogin');
    
      //query the database
      $result = $this->user->login($username, $password);
    
      if($result)
      {
        $sess_array = array();
        foreach($result as $row)
        {
          $sess_array = array(
            'id_func' => $row->id_func,
            'username' => $row->username
          );
          $this->session->set_userdata('logged_in', $sess_array);
        }
        return TRUE;
      }
      else
      {
        $this->form_validation->set_message('check_database', 'Invalid username or password');
        return false;
      }
    }
}
