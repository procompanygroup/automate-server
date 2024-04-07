@extends('admin.layouts.layout')
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ url('/admin') }}">Home</a></li>
                            <li class="breadcrumb-item active"><a href= "{{ route('user.index') }}" >{{ __('general.users',[],'en') }}</a></li>   
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <!-- Horizontal Form -->
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Add User</h3>
                </div>
                <!-- form start -->
                <div class="card-body  row">
                    <div class="col-lg-8">
                        <form class="form-horizontal" name="create_form" method="POST" action="{{ url('admin/user') }}"
                            enctype="multipart/form-data" id="create_form">
                            @csrf

                            <!-- first_name start -->

                            <div class="form-group row">
                                <label for="first_name" class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control     " name="first_name" id="first_name"
                                        placeholder="* First Name" value="">

                                    <span id="first_name-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <!-- first_name end -->

                            <!-- last_name start -->
                            <div class="form-group row">
                                <label for="last_name" class="col-sm-2 col-form-label">Last name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control " name="last_name" id="last_name"
                                        placeholder="* Last Name" value="">
                                    <span id="last_name-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <!-- last_name end -->
                            <!-- Email start -->
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" name="email"class="form-control" id="email"
                                        placeholder="Email" value="">
                                    <span id="email-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <!-- Email end -->
                            <!-- name start -->
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control " name="name" id="name"
                                        placeholder="* Name" value="">
                                    <span id="name-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <!-- name end -->

                            <!-- Password start -->
                            <div class="form-group row">
                                <label for="password" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control  " name="password" id="password"
                                        placeholder="Password" value="">

                                    <span id="password-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <!-- Password end -->
                            <!--Confirm Password start -->
                            <div class="form-group row">
                                <label for="confirm_password" class="col-sm-2 col-form-label">Confirm Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control  " id="confirm_password"
                                        name="confirm_password" placeholder="Confirm Password" value="">
                                    <span id="confirm_password-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <!-- Confirm Password end -->
                            <!-- mobile start -->

                            <div class="form-group row">
                                <label for="mobile" class="col-sm-2 col-form-label">Mobile</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="mobile" id="mobile"
                                        placeholder="mobile" value="">
                                    <span id="mobile-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <!-- mobile end -->

                            <!-- first_name start -->
                            <div class="form-group">
                                <!-- <label for="customFile">Custom File</label> -->
                                <div class="form-group row">
                                    <label for="image" class="col-sm-2 col-form-label">Image</label>
                                    <div class="col-sm-10">

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" name="image"
                                                id="image">
                                            <label class="custom-file-label" id="image_label" for="image">Choose file</label>

                                            <span id="image-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="is_active" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10 custom-control custom-switch ">
                                    <input type="checkbox" class="custom-control-input" id="is_active" name="is_active"
                                        value="1" checked="checked">
                                    <label class="custom-control-label" for="is_active" id="is_active_lbl">Active</label>
                                    <span id="is_active-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2 col-form-label"></div>
                                <div class="col-sm-10">
                                     
                                    <button type="submit" type="submit" name="btn_save" id="btn_save"
                                        class="btn btn-primary   ">Save</button>
                          
                                    <a class="btn btn-danger float-right " href="{{ route('user.index') }}">Cancel</a>
                                    <button id="btn_reset" class="btn btn-default float-right  " style="margin-right: 20px;margin-left: 20px"  >Reset</button>
                                
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4  sm-3  ">
                        <img alt="" id="imgshow"
                            class="rounded img-thumbnail wd-100p float-sm-right  mg-t-10 mg-sm-t-0"
                            src="{{ URL::asset('assets/admin/img/default/1.jpg') }}">
                    </div>
                </div>
            </div>
            <!-- first_name end -->
            <!-- /.card-body -->
            <div class="card-footer">
            </div>
            <!-- /.card-footer -->

    </div>
    <!-- /.card -->
    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- /.card -->
@endsection




@section('js')

    <script src="{{ URL::asset('assets/admin/js/custom/validate.js') }}"></script>
    <script src="{{ URL::asset('assets/admin/js/custom/content.js') }}"></script>
    <script  >  
        var emptyimg ="{{ URL::asset('assets/admin/img/default/1.jpg') }}";
        </script>
@endsection
@section('css')

@endsection
