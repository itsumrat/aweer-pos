<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //
    public function getproductlist(){
    	$prd = DB::select("select code,name,final_price as 'price' from products,product_pricings
            where products.id=product_pricings.product_id");
        return $prd;
    }
}
