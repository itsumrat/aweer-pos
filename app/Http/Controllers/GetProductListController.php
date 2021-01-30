<?php

namespace App\Http\Controllers;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GetProductListController extends Controller
{
    //
    public function getproductlist(){
        $data = DB::table('products')
                    ->leftJoin('units', 'units.id', '=', 'products.unit_id')
                    ->leftJoin('product_pricings', 'product_pricings.product_id', '=', 'products.id')
                    ->select('products.name', 'products.code', 'product_pricings.final_price as price','product_pricings.price_without_tax as without_text_price' ,'units.name as unit_name')
                    ->get();
        return response()->json($data);
//    	$product = new Product();
//    	return $product->getproductlist();
    }
}
