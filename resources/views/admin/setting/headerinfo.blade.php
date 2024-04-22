@extends('admin.layouts.layout')
@section('page-title')
    {{ __('general.settings', [], 'en') }}
@endsection
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
                            <li class="breadcrumb-item active">{{ __('general.settings', [], 'en') }}</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <!-- Horizontal Form -->
                 <!-- Header -->
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Header info</h3>
                </div>
                <!-- Title start -->
                <div class="card-body  row">
                    <div class="col-lg-12">
                        <form class="form-horizontal" name="h_phone_form" method="POST" action="{{url('admin/setting/updatesocial', $item->id)}}" 
                            enctype="multipart/form-data" id="create_social_form">
                            @csrf
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Phone</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name" id="name"
                                        placeholder="Name" value=" {{ $item->value1 }}">
                                    <span id="name-error" class="error invalid-feedback"></span>
                                </div>
                            </div>                          

                            <div class="form-group row">
                                <label for="is_active" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10 custom-control custom-switch ">
                                    <input type="checkbox" class="custom-control-input" id="is_active" name="is_active"
                                    value="{{ $item->is_active }}" @if ( $item->is_active=='1') @checked(true) @endif >
                                    <label class="custom-control-label" for="is_active" id="is_active_lbl">Active</label>
                                    <span id="is_active-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2 col-form-label"></div>
                                <div class="col-sm-10">
                                    <button type="submit" type="submit" name="btn_h_phone" id="btn_h_phone"
                                        class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="col-lg-12">
                        <form class="form-horizontal" name="h_email_form" method="POST" action="{{url('admin/setting/updatesocial', $item->id)}}" 
                            enctype="multipart/form-data" id="create_social_form">
                            @csrf
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name" id="name"
                                        placeholder="Name" value=" {{ $item->value1 }}">
                                    <span id="name-error" class="error invalid-feedback"></span>
                                </div>
                            </div>                          

                            <div class="form-group row">
                                <label for="is_active" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10 custom-control custom-switch ">
                                    <input type="checkbox" class="custom-control-input" id="is_active" name="is_active"
                                    value="{{ $item->is_active }}" @if ( $item->is_active=='1') @checked(true) @endif >
                                    <label class="custom-control-label" for="is_active" id="is_active_lbl">Active</label>
                                    <span id="is_active-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-2 col-form-label"></div>
                                <div class="col-sm-10">
                                    <button type="submit" type="submit" name="btn_h_email" id="btn_h_phone"
                                        class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>

                  
                </div>
             
            </div>
         
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
    <script src="{{ URL::asset('assets/admin/js/custom/social.js') }}"></script>
<script> $(function() {
        $('.textarea').summernote();
 
 
        });
    </script>
@endsection
@section('css')
@endsection
