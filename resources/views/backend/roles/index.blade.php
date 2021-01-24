 @extends('backend.layouts.app')


@section('content')
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">
        <a href="{{ route('roles.create') }}"><i class="fa fa-plus" aria-hidden="true"></i>Add Role</a></h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered custom-btn" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Create Date</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Create Date</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            @foreach ($roles as $key => $role)
            <tr>
              <td>{{ ++$i }}</td>
              <td>{{ $role->name }}</td>
              <td>{{ date('d-M-Y', strtotime($role->created_at)) }}</td>
              <td>
                <a class="admin-actionbtn" href="{{ route('roles.show',$role->id) }}"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></a>
                @if($role->name != 'Super Admin')
                @can('role-edit')
                    <a class="admin-actionbtn" href="{{ route('roles.edit',$role->id) }}"><i class="far fa-edit fa-lg"></i></a>
                @endcan
               {{--  @can('role-delete')
                    {!! Form::open(['method' => 'DELETE','route' => ['roles.destroy', $role->id],'style'=>'display:inline']) !!}
                      <button type="submit" class="admin-actionbtn"><i class="fas fa-trash-alt fa-lg"></i></button> 
                    {!! Form::close() !!}
                @endcan --}}
                @endif
              </td>
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