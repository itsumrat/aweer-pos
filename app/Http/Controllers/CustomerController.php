<?php

namespace App\Http\Controllers;
use App\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
	 public function savecustomer(Request $req){

    	$customer = new Customer();
    	if (isset($req->customer['code'])) 
    		$customer->code = $req->customer['code'];
    	else
    		$customer->code = "cus001";
    	if (isset($req->customer['email'])) 
    		$customer->email = $req->customer['email'];
    	else
    		$customer->email = "demo@cus.com";
    	$customer->name = $req->customer['name'];
    	if (isset($req->customer['city'])) 
    		$customer->city = $req->customer['city'];
    	else
    		$customer->city = "walkincustomer";
    	if (isset($req->customer['phone'])) 
    		$customer->phone = $req->customer['phone'];
    	else
    		$customer->phone = "000000";
    	
    	$customer->country = isset($req->customer['country'])?$req->customer['country']:"walkincustomer";
    	$customer->address = isset($req->customer['address'])?$req->customer['address']:"walkincustomer";
    	$customer->type = $req->customer['type'];
    	$customer->save();
    	return response()->json(["id"=>$customer->id]);
    }
    public function index(){
    	return view('customer');
    }
    
    public function getCustomer(){
    	$customer = new Customer();
    	return $customer->getCustomerList();
    }

    public function getCustomerList(){
    	$customer = new Customer();
    	return json_encode($customer->getCustomerList());
    }
}
