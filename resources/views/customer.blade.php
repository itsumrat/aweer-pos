<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>vuepos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand">Akter Group</a>
      </div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="{{URL::to('pos')}}">POS</a></li>
        <li class="active"><a href="{{URL::to('customer')}}">Customer</a></li>
      </ul>
      </div>
    </nav>
    <div id="mother">
      <customerapp></customerapp>
      <addcustomer></addcustomer>
    </div>
    
    <script src="{{URL::to('public/js/app.js')}}"></script>
  </body>
</html>
