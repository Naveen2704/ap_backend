<?php
defined('BASEPATH') OR exit('No direct script access allowed');
error_reporting(0);

class Orders extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->has_userdata('is_logged_in')) {
            redirect('Auth');
        }
    }

    public function index(){
        $data['orders'] = $this->db->query("select * from orders where status!='0' order by order_id DESC")->result();
        $data['view'] = "orders/list";
        $this->load->view('layout', $data);
    }
}