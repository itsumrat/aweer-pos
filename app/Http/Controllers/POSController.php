<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class POSController extends Controller
{
		public function __construct()
    {
        $this->middleware('permission:pos-list|pos-create|pos-edit|pos-delete', ['only' => ['index', 'store']]);
        $this->middleware('permission:pos-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:pos-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:pos-delete', ['only' => ['destroy']]);
    }
    //
    public function index(){
    	return view('pos');
    } 
}
