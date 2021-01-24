 @extends('backend.layouts.app')


@section('content')
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">
        <a href="{{ route('roles.create') }}"><i class="fa fa-plus" aria-hidden="true"></i>Add</a></h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered custom-btn" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>#</th>
              <th>Role Name</th>
              <th>Access Level</th>
              <th>Access</th>
              <th>Permissions</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>#</th>
              <th>Role Name</th>
              <th>Access Level</th>
              <th>Access</th>
              <th>Permissions</th>
            </tr>
          </tfoot>
          <tbody>
            @foreach ($roles as $key => $role)
            <tr>
              <td>{{ ++$i }}</td>
              <td>{{ $role->name }}</td>
              <td>{{ $role->id }}</td>
              @if($role->id == 1)
              <td>All Modules</td>
              @else
              <td>All Modules Except ERP Setting</td>
              @endif
              @if($role->id == 1)
              <td>View | Add | Edit | Delete</td>
              @else
              <td>View | Add | Edit</td>
              @endif
            </tr>
             @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
  @endsection
  @section('script')
  <script>
    $(document).ready(function() {
      $('#dataTable').DataTable();
    });
  </script>
  @endsection