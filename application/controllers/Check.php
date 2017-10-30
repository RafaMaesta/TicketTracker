<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Check extends CI_Controller {
    function __construct()
    {
        @parent::__construct();
        $this->load->model('user','',TRUE);
    }
  public function index()
	{
        $data = json_decode(trim(file_get_contents('php://input')));
        //Importa lib Validação
        $this->load->library('form_validation');
      
        //$this->form_validation->set_rules('txtLogin', 'Username', 'trim|required|xss_clean');
        //$this->form_validation->set_rules('txtSenha', 'Password', 'trim|required|xss_clean|check_database');
        $password = $data->txtSenha;
        $username = $data->txtLogin;
        //$password = $this->input->post('txtSenha');
        //$username = $this->input->post('txtLogin');
        if($this->check_database($username, $password) == false)
        {
          //Field validation failed.  User redirected to login page
          //$this->load->view('login_view');
          $this->output->set_content_type('application/json');
          return json_encode(false);
          
          
        }
        else
        {
          //Go to private area
          //redirect('Home', 'refresh');
          $this->output->set_content_type('application/json');
          return json_encode(true);
          
        }


		
    }
    
    function check_database($username, $password)
    {
      //query the database
      $result = $this->user->login($username, $password);
    
      if($result)
      {
        $sess_array = array();
        foreach($result as $row)
        {
          $sess_array = array(
            'id_developer' => $row->id_developer,
            'username' => $row->username,
            'id_user_type' => $row->id_user_type
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
