<?php 
error_reporting(0);
require(APPPATH.'libraries/Rest_Controller.php');
require_once (APPPATH.'libraries\razorpay-php\Razorpay.php');
use Razorpay\Api\Api as RazorpayApi;
 
class FrontFrames extends REST_Controller {
    public function __construct() {
        parent::__construct();
        
    }

    public function index_get(){

    }

    public function generalSettings_get(){
        $check = $this->DefaultModel->getSingleRecord('general_settings');
        $data['settings']['title'] = $check->title;
        $data['settings']['description'] = $check->description;
        $data['settings']['keywords'] = $check->keywords;
        $data['settings']['theme_color'] = $check->theme_color;
        $data['settings']['darkLogo'] = base_url('uploads/logo/'.$check->logo_dark);
        $data['settings']['whiteLogo'] = base_url('uploads/logo/'.$check->logo_general);
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function login_post(){
        if(isset($_POST)){
            extract($_POST);
            $password = md5($password);
            $def = $this->db->query("select * from customers where (email='".$email."' or mobile='".$email."') and password='".$password."'")->num_rows();
            if($def > 0){
                $check = $this->db->query("select * from customers where (email='".$email."' or mobile='".$email."') and password='".$password."'")->row();
                $data['userInfo']['username'] = $check->name;
                $data['userInfo']['email'] = $check->email;
                $data['userInfo']['mobile'] = $check->mobile;
                $data['userInfo']['user_id'] = $check->customer_id;
                $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
            }
            else{
                $this->response(array('code'=>'201','message'=>'Authentication Failed'));
            }
        }
    }

    public function CheckMobile_get($mobile){
        $length = strlen($mobile);
        if($length == 10){
            $check = $this->DefaultModel->getAllRecords('customers', array('mobile'=>$mobile));
            if(count($check) <= 0){
                $this->response(array('code'=>'200','message'=>'Mobile Number Not Exists'));
            }
            else{
                $this->response(array('code'=>'201','message'=>'Mobile Number Exists'));
            }
        }
        else{
            $this->response(array('code'=>'201','message'=>'Enter Valid Mobile Number'));
        }
    }

    public function CheckEmail_get($email){
        $check = $this->DefaultModel->getAllRecords('customers', array('email'=>$email));
        if(count($check) <= 0){
            $this->response(array('code'=>'200','message'=>'Email ID Not Exists'));
        }
        else{
            $this->response(array('code'=>'201','message'=>'Email ID Exists'));
        }
    }
    

    // Registration Request POST
    public function registration_post(){
        if(isset($_POST)){
            extract($_POST);
            $check = $this->db->query("select * from customers where email='".$email."' or mobile='".$mobile."'")->result();
            if(count($check) <= 0){
                $data['name'] = $name;
                $data['mobile'] = $mobile;
                $data['email'] = $email;
                $data['password'] = md5($password);
                $data['created_date_time'] = date('Y-m-d H:i:s');
                $data['status'] = 1;
                $customer_id = $this->DefaultModel->insertDataReturnId('customers', $data);
                $userInfo = $this->DefaultModel->getSingleRecord('customers', array('customer_id'=>$customer_id));
                $param['userInfo']['username'] = $userInfo->name;
                $param['userInfo']['email'] = $userInfo->email;
                $param['userInfo']['mobile'] = $userInfo->mobile;
                $param['userInfo']['user_id'] = $userInfo->customer_id;

                $this->response(array('code'=>'200','message'=>'Success','result'=>$param));
            }
            else{
                $this->response(array('code'=>'201','message'=>'Mobile Or Email Already Exists'));
            }

        }
    }

    public function modifyAddress_post(){
        extract($_POST);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['address'] = $address;
        $data['state'] = $state;
        $data['city'] = $city;
        $data['pincode'] = $pincode;
        $address_id = $this->DefaultModel->updateData("user_address", $data, array('user_address_id'=>$user_address_id));
        $this->response(array('code'=>'200','message'=>'success'));
    }

    public function address_post(){
        extract($_POST);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['address'] = $address;
        $data['state'] = $state;
        $data['city'] = $city;
        $data['pincode'] = $pincode;
        $data['user_id'] = $user_id;
        $address_id = $this->DefaultModel->insertDataReturnId("user_address", $data);
        $orderInfo = $this->DefaultModel->getSingleRecord('orders', array('created_by'=>$user_id,'status'=>'0'));
        $order['address_id'] = $address_id;
        $order['status'] = 1;
        $this->DefaultModel->updateData('orders', $order, array('order_id'=>$orderInfo->order_id));
        $this->response(array('code'=>'200','message'=>'success'));
    }

    // Add address id to order_id
    public function addAddress_post(){
        extract($_POST);
        $orderInfo = $this->DefaultModel->getSingleRecord('orders', array('order_id'=>$order_id));
        $total = $this->DefaultModel->getRecordsSum('order_line_items','final',array('order_id'=>$order_id));
        // echo $total->final;
        $data['address_id'] = $address_id;
        $data['appointment_date'] = $date[2]."-".$date[0]."-".$date[1];
        $data['appointment_place'] = $appPlace;
        $data['status'] = 1;
        $this->DefaultModel->updateData("orders", $data, array('order_id'=>$orderInfo->order_id));
        $api = new RazorpayApi('rzp_test_pXaVedARBicyO1', 'gDvBbQpqwpltC2Y2WmmCq7Ki');
        $dat = $api->order->create(array('receipt' => $orderInfo->tracking_id, 'amount' => $total->final, 'currency' => 'INR'));
        // echo "<pre>";print_r($dat);echo "</pre>";
        // echo $dat->id;
        $transaction['transaction_id'] = $dat->id;
        $transaction['amount'] = (int) $dat->amount*100;
        $transaction['receipt'] = $dat->receipt;
        
        $this->response(array('code'=>'200', 'message'=>'Success', 'result' => $transaction));
    }

    
    // Add address id to order_id
    public function addOrderInfo_post(){
        extract($_POST);
        $orderInfo = $this->DefaultModel->getSingleRecord('orders', array('order_id'=>$order_id));
        $total = $this->DefaultModel->getRecordsSum('order_line_items','final',array('order_id'=>$order_id));
        // $date = explode("/", $date);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['appointment_date'] =  $date;
        $data['appointment_place'] = $appPlace;
        $data['status'] = 1;
        $this->DefaultModel->updateData("orders", $data, array('order_id'=>$orderInfo->order_id));
        $api = new RazorpayApi('rzp_test_pXaVedARBicyO1', 'gDvBbQpqwpltC2Y2WmmCq7Ki');
        $dat = $api->order->create(array('receipt' => $orderInfo->tracking_id, 'amount' => $total->final, 'currency' => 'INR'));
        // echo "<pre>";print_r($dat);echo "</pre>";
        $transaction['transaction_id'] = $dat->id;
        $transaction['amount'] = (int) $dat->amount*100;
        $transaction['receipt'] = $dat->receipt;
        
        $this->response(array('code'=>'200', 'message'=>'Success', 'result' => $transaction));
    }

    public function updateQty_get($cart_id, $qty){
        $data['qty'] = $qty;
        $this->DefaultModel->updateData('cart', $data, array('cart_id'=>$cart_id));
        $this->response(array('code'=>'200', 'message'=>'Success'));
    }

    public function placeOrder_get($user_id){
        // extract($_POST);
        $info = $this->DefaultModel->getAllRecords('cart', array('created_by'=>$user_id,'status'=>'0'));   
        if(count($info) > 0){
            $order['status'] = 0;
            $order['created_by'] = $user_id;
            $order['created_date_time'] = date("Y-m-d H:i:s");
            $order_id = $this->DefaultModel->insertDataReturnId('orders', $order);
            $mod['tracking_id'] = generateTrackingId($order_id);
            $this->DefaultModel->updateData('orders', $mod, array('order_id'=>$order_id));
            foreach($info as $value){
                // $cart['status'] = 1;
                // $this->DefaultModel->updateData('cart', $cart, array('cart_id'=>$value->cart_id));
                if($value->type == "Package") {
                   $packInfo = $this->DefaultModel->getSingleRecord('packages', array('package_id' => $value->product_id));  
                   $order1['order_id'] = $order_id;
                   $order1['product_id'] = $value->product_id;
                   $order1['price'] = $packInfo->price;
                   $order1['discount'] = $packInfo->discount;
                   $order1['discount_unit'] = $packInfo->discount_unit;
                   if($packInfo->discount > 0) {
                    $order1['final'] = ($packInfo->price*$packInfo->discount)/100;
                   }
                   else {
                    $order1['final'] = $packInfo->price;
                   }
                   $order1['type'] = "Package";
                   $order1['status'] = 0;
                   $order1['created_date_time'] = date("Y-m-d H:i:s");
                   $this->DefaultModel->insertData('order_line_items', $order1);     
                }
                elseif($value->type == "Investigation") {
                    $invInfo = $this->DefaultModel->getSingleRecord('investigations', array('investigation_id' => $value->product_id));  
                    $order1['order_id'] = $order_id; 
                    $order1['product_id'] = $value->product_id;
                    $order1['price'] = $invInfo->price;
                    $order1['discount'] = $invInfo->discount;
                    $order1['discount_unit'] = $invInfo->discount_unit;
                    if($invInfo->discount > 0) {
                     $order1['final'] = ($invInfo->price*$invInfo->discount)/100;
                    }
                    else {
                     $order1['final'] = $invInfo->price;
                    }
                    $order1['type'] = "Investigation";
                    $order1['status'] = 0;
                    $order1['created_date_time'] = date("Y-m-d H:i:s");
                    $this->DefaultModel->insertData('order_line_items', $order1);     
                }
            }
            $this->response(array('code'=>'200','message'=>'Success', 'result'=>$order_id));
        }
    }

    public function ordersList_get($user_id){
        $info = $this->DefaultModel->getAllRecords('orders', array('created_by' => $user_id));
        if(count($info) > 0){
            $i = 0;
            foreach($info as $value){
                if($value->status == 0){
                    continue;
                }
                $lineItems = $this->DefaultModel->getAllRecords('order_line_items', array('order_id'=>$value->order_id));
                if(count($lineItems) > 0){
                    $price = 0;
                    foreach($lineItems as $val){
                        $price += $val->price;
                    }
                }
                $data['list'][$i]['tracking_id'] = $value->tracking_id;
                $data['list'][$i]['order_id'] = $value->order_id;
                $data['list'][$i]['price'] = $price;
                $data['list'][$i]['status'] = ($value->status == 1) ? 'Not Delivered' : 'Delivered';
                $data['list'][$i]['created_date_time'] = date("d M Y", strtotime($value->created_date_time));
                $i++;
            }
            $this->response(array('code'=>'200','result'=>$data,'message'=>'success'));
        }
        else{
            $data['list'] = [];
            $this->response(array('code'=>'201','result'=>$data,'message'=>'error'));
        }
    }

    public function orderView_get($tracking_id){
        $info = $this->db->query("select * from orders o, order_line_items ol where o.order_id=ol.order_id and o.tracking_id='".$tracking_id."'")->result();

        if(count($info) > 0){            
            $i = 0;$total = 0;
            foreach($info as $value){
                $user_id = $value->created_by;
                $address_id = $value->address_id;
                $stockInfo = stockInfo($value->product_stock_id);
                $proInfo = proInfo($stockInfo->product_id);
                $catInfo = getCategoryInfo($proInfo->category);
                if($stockInfo->sp_price == 0){
                    $price = $stockInfo->price;
                }
                else{
                    $price = $stockInfo->sp_price;
                }
                $full = $price * $value->qty;
                $total += $full;
                $data['order'][$i]['order_id'] = $value->order_id;
                $data['order'][$i]['tracking_id'] = $value->tracking_id;
                $data['order'][$i]['status'] = ($value->status == 1)?'Not Delivered':'Delivered';
                $data['order'][$i]['product_name'] = $proInfo->product_name;
                $data['order'][$i]['category'] = $catInfo->category_name;
                $data['order'][$i]['product_size'] = $stockInfo->product_size;
                $data['order'][$i]['price'] = $value->price;
                $data['order'][$i]['sp_price'] = $stockInfo->sp_price;
                $data['order'][$i]['product_image'] = base_url('uploads/products/'.$proInfo->featured_image);
                $data['order'][$i]['qty'] = $value->qty;
                $data['order'][$i]['total'] = $total;
                $i++;
            }
        }
        $data['userInfo'] = $this->DefaultModel->getSingleRecord('customers', array('customer_id'=>$user_id));
        $data['addressInfo'] = $this->DefaultModel->getSingleRecord('user_address', array('user_address_id'=>$address_id));
        $this->response(array('code'=>'200','result'=>$data,'message'=>'success'));
    }

    public function contact_post(){
        extract($_POST);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['email'] = $email;
        $data['description'] = $description;
        $data['created_date_time'] = date("Y-m-d H:i:s");
        $this->DefaultModel->insertData('contact', $data);
        $this->response(array('code'=>'200','message'=>'Success'));
    }

    public function policies_get(){
        $policyInfo = $this->DefaultModel->getAllRecords('policies');
        if(count($policyInfo) > 0){
            $i = 0;
            foreach($policyInfo as $value){
                $data['policies'][$i]['policy_id'] = $value->policy_id;
                $data['policies'][$i]['policy_name'] = $value->policy_name;
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
    }

    public function singlePolicy_get($policy_id){
        $policyInfo = $this->DefaultModel->getSingleRecord('policies', array('policy_id'=>$policy_id));
        $data['policies'][0]['policy_id'] = $policyInfo->policy_id;
        $data['policies'][0]['policy_name'] = $policyInfo->policy_name;
        $data['policies'][0]['description'] = $policyInfo->description;
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function about_get(){
        $info = $this->DefaultModel->getSingleRecord('about');
        $data['title'] = $info->title;
        $data['description'] = $info->description;
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function sliders_get(){
        $sliders = $this->DefaultModel->getAllRecords('sliders');
        if(count($sliders) > 0){
            $i = 0;
            foreach($sliders as $val){
                $data['sliders'][$i]['slider_title'] = $val->slider_title;
                $data['sliders'][$i]['description'] = $val->description;
                $data['sliders'][$i]['slider_image'] = base_url('uploads/sliders/'.$val->slider_image);
                $i++;
            }
        }
        else{
            $data['sliders'] = [];
        }
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function getCms_get($type){
        $info = $this->DefaultModel->getSingleRecord('cms', array('type'=>urldecode($type)));
        $data['title'] = $info->title;
        $data['description'] = $info->description;
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function getAddress_get($user_id){
        $info = $this->DefaultModel->getAllRecords('user_address', array('user_id'=>$user_id));
        if(count($info) > 0){
            $i = 0;
            foreach($info as $val){
                $data['list'][$i]['address_id'] = $val->user_address_id;
                $data['list'][$i]['name'] = $val->name;
                $data['list'][$i]['mobile'] = $val->mobile;
                $data['list'][$i]['address'] = $val->address;
                $data['list'][$i]['city'] = $val->city;
                $data['list'][$i]['state'] = $val->state;
                $data['list'][$i]['pincode'] = $val->pincode;
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['list'] = [];
            $this->response(array('code'=>'200','message'=>'Error','result'=>$data));
        }
    }

    public function remAddress_get($address_id){
        $this->DefaultModel->deleteRecord('user_address', array('user_address_id'=>$address_id));
        $this->response(array('code'=>'200','message'=>'Success'));
    }

    public function getProfile_get($user_id){
        $userInfo = $this->DefaultModel->getSingleRecord('customers', array('customer_id'=>$user_id));
        $data['userInfo']['name'] = $userInfo->name;
        $data['userInfo']['email'] = $userInfo->email;
        $data['userInfo']['mobile'] = $userInfo->mobile;
        $data['userInfo']['user_id'] = $userInfo->customer_id;
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function updateProfile_post(){
        extract($_POST);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['email'] = $email;
        $this->DefaultModel->updateData('customers', $data, array('customer_id'=>$user_id));
        $this->response(array('code'=>'200','message'=>'Success'));
    }

    public function changePwd_post(){
        extract($_POST);
        $userInfo = $this->DefaultModel->getSingleRecord('customers', array('customer_id'=>$user_id));
        if(md5($old) == $userInfo->password){
            $data['password'] = md5($password);
            $this->DefaultModel->updateData('customers', $data, array('customer_id'=>$user_id));
            $this->response(array('code'=>'200','message'=>'Success'));
        }
        else{
            $this->response(array('code'=>'201','message'=>'Error'));
        }
    }

    public function addressonly_post(){
        extract($_POST);
        $data['name'] = $name;
        $data['mobile'] = $mobile;
        $data['address'] = $address;
        $data['state'] = $state;
        $data['city'] = $city;
        $data['pincode'] = $pincode;
        $data['user_id'] = $user_id;
        $address_id = $this->DefaultModel->insertDataReturnId("user_address", $data);
        $this->response(array('code'=>'200','message'=>'success'));
    }

    public function artistView_get($artist_id){
        $artistInfo = $this->DefaultModel->getSingleRecord('artists', array('artist_id'=>$artist_id));
        $data['artistInfo']['artist_id'] = $artistInfo->artist_id;
        $data['artistInfo']['artist_name'] = $artistInfo->artist_name;
        $data['artistInfo']['description'] = $artistInfo->description;
        $data['artistInfo']['video_link'] = $artistInfo->video_link;
        $data['artistInfo']['artist_image'] = base_url('uploads/artists/'.$artistInfo->artist_image);
        $check = $this->db->query("select * from products where artist_id='".$artistInfo->artist_id."' order by product_id DESC")->result();
        if(count($check) > 0){
            $i = 0;
            foreach($check as $value){
                $catInfo = getCategoryInfo($value->category);
                $info = $this->DefaultModel->getSingleRecord("product_stock", array('product_id'=>$value->product_id));
                $colors = getColors($value->product_id);
                $j = 0;
                foreach($colors as $val){
                    $data['productList'][$i]['colors'][$j] = $val->color;
                    $j++;
                }
                $data['productList'][$i]['product_id'] = $value->product_id;
                $data['productList'][$i]['product_name'] = $value->product_name;
                $data['productList'][$i]['category'] = $catInfo->category_name;
                $data['productList'][$i]['category_id'] = $value->category;
                $data['productList'][$i]['artist_id'] = $value->artist_id;
                $data['productList'][$i]['price'] = $info->price;
                $data['productList'][$i]['sp_price'] = $info->sp_price;
                $data['productList'][$i]['product_image'] = base_url('uploads/products/'.$value->featured_image);
                $i++;
            }
        }
        else{
            $data['productList'] = [];
        }
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function getCart_get($user_id){
        $info = $this->DefaultModel->getAllRecords('cart', array('created_by'=>$user_id,'status'=>'0'));
        if(count($info) > 0){
            $i = 0;$total = 0;
            foreach($info as $value){
                $data['cart'][$i]['type'] = $value->type;
                $data['cart'][$i]['cart_id'] = $value->cart_id;
                if($value->type == "Investigation") {
                    $invInfo = $this->DefaultModel->getSingleRecord('investigations', array('investigation_id' => $value->product_id));
                    $data['cart'][$i]['product_name'] = $invInfo->investigation_name;
                    $data['cart'][$i]['product_id'] = $invInfo->investigation_id;
                    $data['cart'][$i]['price'] = $invInfo->price;
                    $data['cart'][$i]['discount'] = $invInfo->discount;
                    $data['cart'][$i]['discount_unit'] = $invInfo->discount_unit;
                    if($invInfo->discount > 0) {
                        $price = ($invInfo->discount * $invInfo->price)/100;
                        $data['cart'][$i]['disc_price'] = number_format(($invInfo->discount * $invInfo->price)/100, 2);
                    }
                    else {
                        $price = $invInfo->price;
                        $data['cart'][$i]['disc_price'] = $invInfo->price;
                    }
                    $data['cart'][$i]['image'] = base_url('uploads/investigations/'.$invInfo->image);
                }
                elseif($value->type == "Package") {
                    $packageInfo = $this->DefaultModel->getSingleRecord('packages', array('package_id' => $value->product_id));
                    $data['cart'][$i]['product_name'] = $packageInfo->package_name;
                    $data['cart'][$i]['product_id'] = $packageInfo->package_id;
                    $data['cart'][$i]['price'] = $packageInfo->price;
                    $data['cart'][$i]['discount'] = $packageInfo->discount;
                    $data['cart'][$i]['discount_unit'] = $packageInfo->discount_unit;
                    if($packageInfo->discount > 0) {
                        $price = ($packageInfo->discount * $packageInfo->price)/100;
                        $data['cart'][$i]['disc_price'] = number_format(($packageInfo->discount * $packageInfo->price)/100, 2);
                    }
                    else {
                        $price = $packageInfo->price;
                        $data['cart'][$i]['disc_price'] = $packageInfo->price;
                    }
                    $data['cart'][$i]['image'] = base_url('uploads/packages/'.$packageInfo->image);
                }
                $total += $price;
                $i++;
            }
            $data['total'] = number_format($total, 2);
            $data['cartCount'] = count($info);
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['cart'] = [];
            $this->response(array('code'=>'201','message'=>'Error','result'=>$data));
        }
    }

    // get cart items count
    public function getCartCount_get($user_id){
        $count = $this->db->query("select * from cart where created_by='".$user_id."'")->num_rows();
        if($count < 0){
            $count = 0;
        }
        else{
            $count = $count;
        }
        $data['count'] = $count;
        $this->response(array('code'=>'200','message'=>'Success','result' => $data));
    }

    // add item to cart
    public function addToCart_get($product_id, $type, $user_id){
        $check = $this->DefaultModel->getSingleRecord('cart', array('product_id'=>$product_id,'created_by'=>$user_id,'status'=>0,'type'=>$type));
        if(is_null($check)) {
            $data['created_by'] = $user_id;
            $data['type'] = $type;
            $data['product_id'] = $product_id;
            $data['status'] = 0;
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->insertData("cart", $data);
            $this->response(array('code'=>'200','message'=>'Success'));
        }
        else {
            $this->response(array('code'=>'203','message'=>'Investigation already added'));
        }
    }

    public function remCart_get($cart_id){
        $this->DefaultModel->deleteRecord('cart', array('cart_id' => $cart_id));
        $this->response(array('code'=>'200', 'message'=>'Success'));
    }

    // Get Menus 
    public function GetCategories_get(){
        $menus = $this->DefaultModel->getAllRecords('categories');
        if(count($menus) > 0){
            $i = 0;
            foreach($menus as $value){
                $data['menusList'][$i]['menu_name'] = $value->category_name;
                $data['menusList'][$i]['menu_id'] = $value->category_id;
                $data['menusList'][$i]['menu_image'] = base_url('uploads/categories/'.$value->image);
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['menusList'] = [];
            $this->response(array('code'=>'201','message'=>'Error Occured','result'=>$data));
        }
    }

    // Get Packages 
    public function GetPackages_get($popular = ''){
        if($popular == "") {
            $investigations = $this->DefaultModel->getAllRecords('packages');
        }
        else {
            $investigations = $this->DefaultModel->getAllRecords('packages', array('popular' => $popular));
        }
        
        $packages = $this->DefaultModel->getAllRecords('packages');
        if(count($packages) > 0){
            $i = 0;
            foreach($packages as $value){
                $data['packages'][$i]['package_name'] = $value->package_name;
                $data['packages'][$i]['package_id'] = $value->package_id;
                $data['packages'][$i]['price'] = $value->price;
                $data['packages'][$i]['discount'] = $value->discount;
                $data['packages'][$i]['discount_unit'] = $value->discount_unit;
                if($value->discount > 0) {
                    $data['packages'][$i]['disc_price'] = ($value->discount * $value->price)/100;
                }
                else {
                    $data['packages'][$i]['disc_price'] = $value->price;
                }
                $data['packages'][$i]['image'] = base_url('uploads/packages/'.$value->image);
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['packages'] = [];
            $this->response(array('code'=>'201','message'=>'Error Occured','result'=>$data));
        }
    }

    public function invPackSearch_get($search) {
        $investigations = $this->DefaultModel->getAllRecords('investigations', array('investigation_name LIKE ' => '%' . $search . '%'));
        if(count($investigations) > 0){
            $i = 0;
            foreach($investigations as $value){
                $data['search'][$i]['name'] = $value->investigation_name;
                $data['search'][$i]['id'] = $value->investigation_id;
                $data['search'][$i]['type'] = "Investigation";
                $i++;
            }
        }
        
        $packages = $this->DefaultModel->getAllRecords('packages', array('package_name LIKE ' => '%' . $search . '%'));
        if(count($packages) > 0){
            $i = 0;
            foreach($packages as $value){
                $data['search'][$i]['name'] = $value->package_name;
                $data['search'][$i]['id'] = $value->package_id;
                $data['search'][$i]['type'] = "Package";
                $i++;
            }
        }
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    // Get Investigations 
    public function GetInvestigations_get($category = ''){
        if($popular != "") {
            $pop = "'popular' => ".$popular;
        }
        if($category == "") {
            $investigations = $this->DefaultModel->getAllRecords('investigations');
        }
        else {
            $investigations = $this->DefaultModel->getAllRecords('investigations', array('category' => $category, ''));
        }
        
        if(count($investigations) > 0){
            $i = 0;
            foreach($investigations as $value){
                $catInfo = getCategoryInfo($value->category);
                $data['investigations'][$i]['investigation_name'] = $value->investigation_name;
                $data['investigations'][$i]['investigation_id'] = $value->investigation_id;
                $data['investigations'][$i]['category'] = $catInfo->category_name;
                $data['investigations'][$i]['price'] = $value->price;
                $data['investigations'][$i]['discount'] = $value->discount;
                $data['investigations'][$i]['discount_unit'] = $value->discount_unit;
                if($value->discount > 0) {
                    $data['investigations'][$i]['disc_price'] = ($value->discount * $value->price)/100;
                }
                else {
                    $data['investigations'][$i]['disc_price'] = $value->price;
                }
                $data['investigations'][$i]['image'] = base_url('uploads/investigations/'.$value->image);
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['investigations'] = [];
            $this->response(array('code'=>'201','message'=>'Error Occured','result'=>$data));
        }
    }

    // Investigation Info
    public function invInfo_get($investigation_id) {
        $check = $this->DefaultModel->getSingleRecord('investigations', array('investigation_id'=>$investigation_id));
        if(!is_null($check)) {
            $check->image = base_url('uploads/investigations/'. $check->image);
            $this->response(array('code'=>'200','message'=>'Success','result'=>$check));
        }
        else {
            $this->response(array('code'=>'201','message'=>'Error Found'));
        }
        
    }

    // Get Popular Investigations 
    public function popularInvestigations_post(){
        extract($_POST);
        $investigations = $this->DefaultModel->getAllRecords('investigations', array('popular' => $popular));
        
        if(count($investigations) > 0){
            $i = 0;
            foreach($investigations as $value){
                $catInfo = getCategoryInfo($value->category);
                $data['investigations'][$i]['investigation_name'] = $value->investigation_name;
                $data['investigations'][$i]['investigation_id'] = $value->investigation_id;
                $data['investigations'][$i]['category'] = $catInfo->category_name;
                $data['investigations'][$i]['price'] = $value->price;
                $data['investigations'][$i]['discount'] = $value->discount;
                $data['investigations'][$i]['discount_unit'] = $value->discount_unit;
                if($value->discount > 0) {
                    $data['investigations'][$i]['disc_price'] = ($value->discount * $value->price)/100;
                }
                else {
                    $data['investigations'][$i]['disc_price'] = $value->price;
                }
                $data['investigations'][$i]['image'] = base_url('uploads/investigations/'.$value->image);
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $data['investigations'] = [];
            $this->response(array('code'=>'201','message'=>'Error Occured','result'=>$data));
        }
    }

    // Add Customer to scheme
    public function addCustomer_post(){
        if(isset($_POST)){
            extract($_POST);
            $check = $this->db->query("select * from customers where mobile='".$mobile."'")->row();
            if(count($check) > 0){
                $checkScheme = $this->db->query("select * from customer_schemes where scheme_id='".$scheme_id."' and customer_id='".$customer_id."'")->row();
                if(count($checkScheme) > 0){
                    // $this->response(array('code'=>'201','message'=>'Already Scheme Exi'))
                }
            }
            $data['customer_name'] = $customer_name;
            $data['mobile'] = $mobile;
            $data['email'] = $email;
            $data['id_proof_type'] = $id_proof;
            $data['id_number'] = $id_proof_number;
            $data['created_by'] = $user_id;
            $data['created_date_time'] = date("Y-m-d H:i:s");
            $data['modified_by'] = $user_id;
            $data['modified_date_time'] = date("Y-m-d H:i:s");
            $customer_id = $this->DefaultModel->insertDataReturnId("customers", $data);
            $mapData['scheme_id'] = $scheme;
            $mapData['customer_id'] = $customer_id;
            $mapData['status'] = 1;
            $mapData['created_by'] = $user_id;
            $mapData['created_date_time'] = date("Y-m-d H:i:s");
            $mapData['modified_by'] = $user_id;
            $mapData['modified_date_time'] = date("Y-m-d H:i:s");
            $this->DefaultModel->insertData('customer_schemes', $mapData);
            $this->response(array('code'=>'200','message'=>'Success'));
        }
        else{
            $this->response(array('code'=>'201','message'=>'Error'));
        }
    }


    // remove item from cart
    public function removeCart_get($id){
        $check = $this->DefaultModel->getSingleRecord('cart', array('id'=>$id));
        if(count($check) > 0){
            $this->DefaultModel->deleteRecord('cart', array('id'=>$id));
            $this->response(array('code'=>'200','message'=>'Success'));
        }
        else{
            $this->response(array('code'=>'201','message'=>'Error Occured'));
        }
    }

    // address list of user
    public function address_get($user_id){
        $check = $this->DefaultModel->getAllRecords("user_address", array("user_id"=>$user_id));
        if(count($check) > 0){
            $i = 0;
            foreach($check as $value){
                $data['address'][$i]['address_id'] = $value->user_address_id;
                $data['address'][$i]['user_id'] = $value->user_id;
                $data['address'][$i]['address'] = $value->address;
                $data['address'][$i]['name'] = $value->name;
                $data['address'][$i]['mobile'] = $value->mobile;
                $data['address'][$i]['state'] = $value->state;
                $data['address'][$i]['city'] = $value->city;
                $data['address'][$i]['pincode'] = $value->pincode;
                $i++;
            }
            $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
        }
        else{
            $this->response(array('code'=>'201','message'=>'Error Occured'));
        }
    }

    public function artwork_get(){
        $info = $this->DefaultModel->getAllRecords('artwork');
        if(count($info) > 0){
            $i = 0;
            foreach($info as $value){
                $artistInfo = $this->DefaultModel->getSingleRecord('artists', array('artist_id'=>$value->artist));
                $data['artwork'][$i]['artwork_id'] = $value->artwork_id;
                $data['artwork'][$i]['title'] = $value->title;
                $data['artwork'][$i]['description'] = $value->description;
                $data['artwork'][$i]['artist_id'] = $artistInfo->artist_id;
                $data['artwork'][$i]['artist_name'] = $artistInfo->artist_name;
                $data['artwork'][$i]['image'] = base_url('uploads/artwork/'.$value->image);
                $i++;
            }
        }
        else{
            $data['artwork'] = [];
        }        
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }

    public function singleArtwork_get($artwork_id){
        $artworkInfo = $this->DefaultModel->getSingleRecord("artwork", array('artwork_id'=>$artwork_id));
        $productInfo = $this->DefaultModel->getAllRecords("products", array('artwork_id'=>$artwork_id));
        $artistInfo = $this->DefaultModel->getSingleRecord("artists", array('artist_id'=>$artworkInfo->artist));
        $data['artwork']['artwork_id'] = $artworkInfo->artwork_id;
        $data['artwork']['title'] = $artworkInfo->title;
        $data['artwork']['description'] = $artworkInfo->description;
        $data['artwork']['image'] = base_url('uploads/artwork/'.$artworkInfo->image);
        $data['artist']['artist_id'] = $artistInfo->artist_id;
        $data['artist']['artist_name'] = $artistInfo->artist_name;
        $data['artist']['description'] = $artistInfo->description;
        $data['artist']['artist_image'] = base_url('uploads/artists/'.$artistInfo->artist_image);
        $data['artist']['video_link'] = $artistInfo->video_link;
        if(count($productInfo) > 0){
            $i = 0;
            foreach($productInfo as $value){
                $catInfo = getCategoryInfo($value->category);
                $info = $this->DefaultModel->getSingleRecord("product_stock", array('product_id'=>$value->product_id));
                $colors = getColors($value->product_id);
                $j = 0;
                foreach($colors as $val){
                    $data['productList'][$i]['colors'][$j] = $val->color;
                    $j++;
                }
                $data['productList'][$i]['product_id'] = $value->product_id;
                $data['productList'][$i]['product_name'] = $value->product_name;
                $data['productList'][$i]['category'] = $catInfo->category_name;
                $data['productList'][$i]['category_id'] = $value->category;
                $data['productList'][$i]['artist_id'] = $value->artist_id;
                $data['productList'][$i]['price'] = $info->price;
                $data['productList'][$i]['sp_price'] = $info->sp_price;
                $data['productList'][$i]['product_image'] = base_url('uploads/products/'.$value->featured_image);
                $i++;
            } 
        }
        $this->response(array('code'=>'200','message'=>'Success','result'=>$data));
    }
    
}
?>