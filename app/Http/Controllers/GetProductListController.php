<?php

namespace App\Http\Controllers;
use App\Product;
use Illuminate\Http\Request;

class GetProductListController extends Controller
{
    //
    public function getproductlist(){
    	$product = new Product();
    	return $product->getproductlist();
    }
}
