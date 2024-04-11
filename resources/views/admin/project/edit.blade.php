@extends('admin.layouts.layout')
@section('page-title')
    {{ __('general.projects', [], 'en') }}
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
                            <li class="breadcrumb-item active"><a
                                    href= "{{ route('project.index') }}">{{ __('general.projects', [], 'en') }}</a></li>
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
                    <h3 class="card-title">Edit Project</h3>
                </div>
                <!-- form start -->
                <div class="card-body  row">
                    <div class="col-lg-12">
                        <form class="form-horizontal" name="create_form" method="POST" action="{{route('project.update', $item->id)}}" 
                            enctype="multipart/form-data" id="create_form">
                            @csrf

                            <div class="form-group row">
                                <label for="title" class="col-sm-2 col-form-label">Title</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="title" id="title"
                                        placeholder="* Title" value="{{ $item->title }}">

                                    <span id="title-error" class="error invalid-feedback"></span>

                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="slug" class="col-sm-2 col-form-label">Slug</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control " name="slug" id="slug"
                                        placeholder="Slug" value="{{ $item->slug }}">
                                    <span id="slug-error" class="error invalid-feedback"></span>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="metakey" class="col-sm-2 col-form-label">Keywords</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="2" name="metakey" id="metakey" placeholder="Keywords">{{ $item->metakey }}</textarea>
                                    <span id="metakey-error" class="error invalid-feedback"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="status" class="col-sm-2 col-form-label">Status</label>
                                <div class="col-sm-10 custom-control custom-switch ">
                                    <input type="checkbox" class="custom-control-input" id="status" name="status"
                                        value="{{ $item->status }}"
                                        @if ($item->status == '1') @checked(true) @endif>
                                    <label class="custom-control-label" for="status" id="status_lbl">Active</label>
                                    <span id="status-error" class="error invalid-feedback"></span>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-2 col-form-label"></div>
                                <div class="col-sm-10">
                                    <button type="submit" type="submit" name="btn_update_user" id="btn_update_user"
                                        class="btn btn-primary">Save</button>

                                    <a class="btn btn-danger float-right " href="{{ route('project.index') }}">Cancel</a>
                                    <button id="btn_reset" class="btn btn-default float-right  "
                                        style="margin-right: 20px;margin-left: 20px">Reset</button>

                                </div>
                            </div>
                        </form>
                    </div>
                  
                   <!--translation && media -->
                   <div class="col-12 col-sm-12">
                    <div class="card card-primary card-tabs">
                      <div class="card-header p-0 pt-1">
                        <ul class="nav nav-tabs" id="project-tabs-one-tab" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link active" id="custom-tabs-one-trans-tab" data-toggle="pill" href="#custom-tabs-one-trans" role="tab" aria-controls="custom-tabs-one-trans" aria-selected="true">Translation</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="custom-tabs-one-media-tab" data-toggle="pill" href="#custom-tabs-one-media" role="tab" aria-controls="custom-tabs-one-media" aria-selected="false">Media</a>
                          </li>
                          
                        </ul>
                      </div>
                      <div class="card-body">
                        <div class="tab-content" id="project-tabs-one-tabContent">
                          <div class="tab-pane fade show active" id="custom-tabs-one-trans" role="tabpanel" aria-labelledby="custom-tabs-one-trans-tab">
                            <p >Edit Translation</p>                             
                              
                            <div class="card card-primary card-outline card-outline-tabs">
                              <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" id="trans-tabs-four-tab" role="tablist">

                                  @foreach ($lang_list as $lang)
                                  <li class="nav-item">
                                    <a class="nav-link @once active @endonce" id="lang-{{$lang->id}}-tab" data-toggle="pill" href="#lang-{{$lang->id}}" role="tab" aria-controls="lang-{{$lang->id}}" aria-selected="true">{{$lang->name}}</a>
                                  </li>
                                  @endforeach
                                  
                                </ul>
                              </div>
                              <div class="card-body">
                                <div class="tab-content" id="trans-tabs-four-tabContent">
                                  @foreach ($lang_list as $lang)
                                  <div class="tab-pane fade @once show active @endonce " id="lang-{{$lang->id}}" role="tabpanel" aria-labelledby="lang-{{$lang->id}}-tab">
                                    <form class="form-horizontal" name="update_trans_form-{{$lang->id}}" method="POST" action="{{route('langproject.update', $item->id)}}" 
                                      enctype="multipart/form-data" id="update_trans_form-{{$lang->id}}">
                                      @csrf
          
                                      <div class="form-group row">
                                          <label for="title_trans" class="col-sm-2 col-form-label">Title</label>
                                          <div class="col-sm-10">
                                              <input type="text" class="form-control" name="title_trans" id="title_trans"
                                                  placeholder="* Title" value="@if($lang->langprojects->first()){{$lang->langprojects->first()->title_trans }}@endif">
          
                                              <span id="title_trans-error" class="error invalid-feedback"></span>
          
                                          </div>
                                      </div>
                                        
                                      <div class="form-group row">
                                          <label for="content_trans" class="col-sm-2 col-form-label">Content</label>
                                          <div class="col-sm-10">
                                            <textarea class="textarea" name="content_trans"  id="content_trans" rows="10"  placeholder="Place the translation here"
                                            style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">@if($lang->langprojects->first()){{$lang->langprojects->first()->content_trans}}@endif</textarea>
                                            <span id="content_trans-error" class="error invalid-feedback"></span>
                                          </div>
                                      </div>
                                      <input type="hidden" value="{{$lang->id}}" name="lang_id">
          
                                      <div class="form-group row">
                                          <div class="col-sm-2 col-form-label"></div>
                                          <div class="col-sm-10">
                                              <button type="submit" type="submit" name="btn_update_trans-{{$lang->id}}" id="btn_update_trans-{{$lang->id}}"
                                                  class="btn btn-primary btn_update_trans">Save</button>         
                                          </div>
                                      </div>
                                  </form>

                               
                                  </div>
                                  @endforeach
 
                                </div>
                              </div>
                              <!-- /.card -->
                            </div>
                             
                          </div>
                          <div class="tab-pane fade" id="custom-tabs-one-media" role="tabpanel" aria-labelledby="custom-tabs-one-media-tab">
                            Media Mauris tincidunt mi at erat gravida, eget tristique urna bibendum. Mauris pharetra purus ut ligula tempor, et vulputate metus facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus interdum, nisl ligula placerat mi, quis posuere purus ligula eu lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere nec nunc. Nunc euismod pellentesque diam. 
                          </div>
                          
                        </div>
                      </div>
                      <!-- /.card -->
                    </div>
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
    <script src="{{ URL::asset('assets/admin/js/custom/project.js') }}"></script>
    <script>
        var emptyimg = "{{ URL::asset('assets/admin/img/default/1.jpg') }}";
        $(function() {
        $('.textarea').summernote();
        });
    </script>
@endsection
@section('css')

@endsection
