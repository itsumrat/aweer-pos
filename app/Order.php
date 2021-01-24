<?php
namespace App;
use DB;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table='orders';
    public function getOrder($id){
    	return DB::select("select *,orders.id as 'inv_id',date(orders.updated_at) as 'inv_date',customers.id as 'cus_id' from orders,customers where orders.id='$id' and orders.customer_id=customers.id");
    }
    public function getorderlist(){
    	return DB::select("select id,total,IF(status=1,'PAID','CREDIT') as 'status' ,date(created_at) as 'created_at' from orders  WHERE status<3 ORDER BY id DESC LIMIT 5");	
    }
    public function getholdorderlist(){
    	return DB::select("select id,total,'open' as status ,date(created_at) as 'created_at' from orders  WHERE status=3 ORDER BY id DESC LIMIT 5");	
    }
}
