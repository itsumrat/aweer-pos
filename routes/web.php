<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => ['auth', 'verified']], function () {
    Route::resource('roles', 'Backend\RoleController');
    Route::get('roles-permissions', 'Backend\RoleController@getRolesPermission')->name('role.permission');
    Route::resource('permissions', 'Backend\PermissionController');
    // user part
    Route::resource('users', 'Backend\UserController');
    Route::get('pos', 'POSController@index')->name('pos');
});

Route::get('getproductlist', 'GetProductListController@getproductlist');
//Route::get('pos', 'POSController@index');

Route::get('getcustomerlist', 'CustomerController@getCustomer');
Route::get('getcustomerjson', 'CustomerController@getcustomerlist');
Route::get('customer', 'CustomerController@index');
Route::post('savecustomer', 'CustomerController@savecustomer');

Route::post('order', 'OrderController@saveorder');
Route::get('order/printinvoice', 'OrderController@printinvoice');
Route::get('getorderlist', 'OrderController@getorderlist');
Route::get('getholdorderlist', 'OrderController@getholdorderlist');
Route::get('getsingleorder', 'OrderController@getSingleOrder');










