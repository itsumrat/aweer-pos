<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use PDF;

class OrderController extends Controller
{
    //
    public function saveorder(Request $req){

        $order = isset($req->order['id']) && $req->order['id']>0? Order::find((int)$req->order['id']): new Order();
    	$order->customer_id = $req->order['customer']['id'];
    	$order->order_details = serialize($req->order['lineItems']);
    	$order->total = $req->order['grandTotal'];
    	$order->status = $req->order['status'];
    	$order->save();

    	// return response()->json($req->all());
    	return response()->json(["id"=>$order->id]);
    }
    public function getorderlist(){

    	$order = new Order();
    	
    	return $order->getorderlist();
    }
    public function getholdorderlist(){

    	$order = new Order();
    	
    	return $order->getholdorderlist();
    }
    public function printinvoice(Request $req){
    	$order = new Order();
    	$ja_data =  $order->getOrder($req->id);
    	$jo_data = $ja_data[0];
    	$data = array();
    	$data['invoice_no'] = $jo_data->inv_id;
    	$data['invoice_date'] = $jo_data->inv_date;
    	$data['name'] = $jo_data->name;
    	$data['phn'] = $jo_data->phone;
    	$data['mail_address'] = $jo_data->email;
    	$data['city'] = $jo_data->city.', '.$jo_data->country;
    	$data['address'] = $jo_data->address;
    	$data['products'] = unserialize($jo_data->order_details);
    	$data['total'] = $jo_data->total;
    	$data['status'] = $jo_data->status;
    	$pdf = PDF::loadView('invoice', $data);
    	return $pdf->stream('pdf_file.pdf');	
    }
    public function getSingleOrder(Request $req){
        $order = new Order();
        $ja_data =  $order->getOrder($req->id);
        $jo_data = $ja_data[0];
        $data = array();
        $data['invoice_no'] = $jo_data->inv_id;
        // $data['invoice_date'] = $jo_data->inv_date;
        $data['cus_id'] = $jo_data->cus_id;
        $data['name'] = $jo_data->name;
        $data['phn'] = $jo_data->phone;
        // $data['mail_address'] = $jo_data->email;
        // $data['city'] = $jo_data->city.', '.$jo_data->country;
        // $data['address'] = $jo_data->address;
        $data['products'] = unserialize($jo_data->order_details);
        return $data;
        // $data['total'] = $jo_data->total;
        // $data['status'] = $jo_data->status;
        // $pdf = PDF::loadView('invoice', $data);
        // return $pdf->stream('pdf_file.pdf');    
    }
}
