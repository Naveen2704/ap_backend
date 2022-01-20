<?php
defined('BASEPATH') OR exit('No direct script access allowed');
error_reporting(0);

class Investigations extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if(!$this->session->has_userdata('is_logged_in'))
        {
            redirect('Auth');
        }
    }

    public function index(){
        $data['investigations'] = $this->DefaultModel->getAllRecords('investigations');
        $data['view'] = "investigations/list";
        $this->load->view('layout', $data);
    }

    public function add(){
        $data['categories'] = $this->DefaultModel->getAllRecords('categories');
        $data['view'] = "investigations/add";
        $this->load->view('layout', $data);
    }

    public function addInv(){
        extract($_POST);
        if(isset($_POST['add'])){
            
            if(isset($_FILES['file']['name'])){
                $path = './uploads/investigations/';
                $config['upload_path'] = './uploads/investigations/';
                $config['allowed_types'] = 'jpg|JPG|png|PNG|jpeg|JPEG';  
                $this->load->library('upload');
                $this->upload->initialize($config);
                $this->upload->do_upload('file'); //uploading file to server
                $fileData=$this->upload->data('file_name');
                $inputFileName =  $fileData;
                $data['image'] = $inputFileName;
            }
            $data['investigation_name'] = $title;
            $data['category'] = $category;
            $data['short_keywords'] = $short_names;
            $data['description'] = $description;
            $data['price'] = $price;
            $data['discount'] = $discount;
            $data['discount_unit'] = $discount_unit;
            $data['status'] = $status;
            $data['created_by'] = $this->session->userdata('user_id');
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->insertData('investigations', $data);
            redirect('Investigations');
        }
    }

    public function delete($inv_id){
        $this->DefaultModel->deleteRecord('investigations', array('investigation_id'=>$inv_id));
        redirect('Investigations');
    }

    public function edit($inv_id){
        $data['invInfo'] = $this->DefaultModel->getSingleRecord('investigations', array('investigation_id'=>$inv_id));
        $data['categories'] = $this->DefaultModel->getAllRecords('categories');
        $data['view'] = "investigations/edit";
        $this->load->view('layout', $data);
    }

    public function editInv(){
        extract($_POST);
        if(isset($_POST['edit'])){
            
            if(isset($_FILES['file']['name'])){
                $path = './uploads/investigations/';
                $config['upload_path'] = './uploads/investigations/';
                $config['allowed_types'] = 'jpg|JPG|png|PNG|jpeg|JPEG';  
                $this->load->library('upload');
                $this->upload->initialize($config);
                $this->upload->do_upload('file'); //uploading file to server
                $fileData=$this->upload->data('file_name');
                $inputFileName =  $fileData;
                $data['image'] = $inputFileName;
            }
            $data['investigation_name'] = $title;
            $data['category'] = $category;
            $data['short_keywords'] = $short_names;
            $data['description'] = $description;
            $data['price'] = $price;
            $data['discount'] = $discount;
            $data['discount_unit'] = $discount_unit;
            $data['status'] = $status;
            $data['created_by'] = $this->session->userdata('user_id');
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->updateData('investigations', $data, array('investigation_id'=>$investigation_id));
            redirect('Investigations');
        }
    }

}