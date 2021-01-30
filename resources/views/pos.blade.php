<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>POS</title>
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
        <li class="active">
          <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
          <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
              @csrf
          </form>
        </li>
      </ul>
      </div>
    </nav>
    <div id="mother">
      <div class="container">


{{--      <button type="button" class="btn btn-info float-right" data-toggle="modal" data-target="#myModal">Add Customer</button>--}}
      </div>
      <app></app>

      <!-- Modal -->
      <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Add Customer</h4>
            </div>
            <div class="modal-body">
            <addcustomer></addcustomer>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>

        </div>
      </div>

    </div>
    <script src="{{asset('js/app.js')}}"></script>
  </body>
</html>
