<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

// include "phpqrcode/qrlib.php";
if ( ! function_exists('is_logged_in'))

{

    function is_logged_in()
    {
        $CI =& get_instance();

        $user = $CI->session->userdata('is_logged_in');

        if (!isset($user)) { return false; } else { return true; }

    }

    function generateTrackingId($order_id){
        return "APD-ORD00".$order_id;
    }

    function getCategoryInfo($category_id){
        $CI =& get_instance();
        $catInfo = $CI->db->query("select * from categories where category_id='".$category_id."'")->row();
        return $catInfo;
    }

    function getInvNames($inv){
        $CI =& get_instance();
        $invInfo = $CI->db->query("select GROUP_CONCAT(investigation_name) as inv_names from investigations where investigation_id IN (".$inv.")")->row();
        return $invInfo->inv_names;
    }

    function getInvInfo($inv_id){
        $CI =& get_instance();
        $invInfo = $CI->db->query("select * from investigations where investigation_id='".$inv_id."'")->row();
        return $invInfo;
    }

    function proInfo($product_id){
        $CI =& get_instance();
        $info = $CI->db->query("select * from products where product_id='".$product_id."'")->row();
        return $info;
    }

    function getArtistName($artist_id){
        $CI =& get_instance();
        $info = $CI->db->query("select * from artists where artist_id='".$artist_id."'")->row();
        return $info->artist_name;
    }

    function stockInfo($stock_id){
        $CI =& get_instance();
        $info = $CI->db->query("select * from product_stock where product_stock_id='".$stock_id."'")->row();
        return $info;
    }

    function getCatProducts($category_id){
        $CI =& get_instance();
        $proCount = $CI->db->query("select * from investigations where category='".$category_id."'")->num_rows();
        return $proCount;
    }

    function createSKUcode($product_id, $size){
        $CI =& get_instance();
        $stockInfo = $CI->db->query("select product_stock_id from product_stock")->num_rows();
        return $skuCode = "LH0".$product_id.$size.$stockInfo;
    }

    function getColors($product_id){
        $CI =& get_instance();
        $colors = $CI->db->query("select color from product_stock where product_id='".$product_id."' group by color")->result();
        return $colors;
    }

    function getSizes($product_id){
        $CI =& get_instance();
        $sizes = $CI->db->query("select product_size from product_stock where product_id='".$product_id."' group by product_size")->result();
        return $sizes;
    }

}

?>