<?php
defined('BASEPATH') OR exit('No direct script access allowed');
error_reporting(0);

class Packages extends CI_Controller {

    public function __construct(){
        parent::__construct();
        if(!$this->session->has_userdata('is_logged_in'))
        {
            redirect('Auth');
        }
    }

    public function index(){
        $data['packages'] = $this->DefaultModel->getAllRecords('packages');
        $data['view'] = "packages/list";
        $this->load->view('layout', $data);
    }

    public function add(){
        $data['investigations'] = $this->DefaultModel->getAllRecords('investigations');
        $data['view'] = "packages/add";
        $this->load->view('layout', $data);
    }

    public function addPackage(){
        extract($_POST);
        if(isset($_POST['add'])){
            
            if(isset($_FILES['file']['name'])){
                $path = './uploads/packages/';
                $config['upload_path'] = './uploads/packages/';
                $config['allowed_types'] = 'jpg|JPG|png|PNG|jpeg|JPEG';  
                $this->load->library('upload');
                $this->upload->initialize($config);
                $this->upload->do_upload('file'); //uploading file to server
                $fileData=$this->upload->data('file_name');
                $inputFileName =  $fileData;
                $data['image'] = $inputFileName;
            }
            $data['package_name'] = $title;
            $data['investigations'] = implode(",", $investigations);
            $data['description'] = $description;
            $data['price'] = $price;
            $data['discount'] = $discount;
            $data['discount_unit'] = $discount_unit;
            $data['status'] = $status;
            $data['created_by'] = $this->session->userdata('user_id');
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->insertData('packages', $data);
            redirect('Packages');
        }
    }

    public function delete($pk_id){
        $this->DefaultModel->deleteRecord('packages', array('package_id'=>$pk_id));
        redirect('Packages');
    }

    public function edit($pk_id){
        $data['packageInfo'] = $this->DefaultModel->getSingleRecord('packages', array('package_id'=>$pk_id));
        $data['investigations'] = $this->DefaultModel->getAllRecords('investigations');
        $data['view'] = "packages/edit";
        $this->load->view('layout', $data);
    }

    public function editPackage(){
        extract($_POST);
        if(isset($_POST['edit'])){
            
            if(isset($_FILES['file']['name'])){
                $path = './uploads/pacakges/';
                $config['upload_path'] = './uploads/packages/';
                $config['allowed_types'] = 'jpg|JPG|png|PNG|jpeg|JPEG';  
                $this->load->library('upload');
                $this->upload->initialize($config);
                $this->upload->do_upload('file'); //uploading file to server
                $fileData=$this->upload->data('file_name');
                $inputFileName =  $fileData;
                $data['image'] = $inputFileName;
            }
            $data['package_name'] = $title;
            $data['investigations'] = implode(",", $investigations);
            $data['description'] = $description;
            $data['price'] = $price;
            $data['discount'] = $discount;
            $data['discount_unit'] = $discount_unit;
            $data['status'] = $status;
            $data['created_by'] = $this->session->userdata('user_id');
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->updateData('packages', $data, array('package_id'=>$package_id));
            redirect('Packages');
        }
    }

}