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
                             <p >Edit Media</p> 
                             <div class="card card-primary card-outline card-outline-tabs">
                              <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" id="custom-tabs-four-media" role="tablist">
                                  <li class="nav-item">
                                    <a class="nav-link active" id="custom-tabs-four-images-tab" data-toggle="pill" href="#custom-tabs-four-images" role="tab" aria-controls="custom-tabs-four-images" aria-selected="true">Images</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" id="custom-tabs-four-video-tab" data-toggle="pill" href="#custom-tabs-four-video" role="tab" aria-controls="custom-tabs-four-video" aria-selected="false">Video</a>
                                  </li>
                                  
                                </ul>
                              </div>
                              <div class="card-body">
                                <div class="tab-content" id="custom-tabs-four-tabContent">
                                  <div class="tab-pane fade show active" id="custom-tabs-four-images" role="tabpanel" aria-labelledby="custom-tabs-four-images-tab">
                                  
                                    <div class="card-header">
                                      <h3 class="card-title"></h3>
                            
                                      <div class="card-tools">
                                   
                                                      <button type="button"  class="btn btn-info btn-sm" data-toggle="modal" data-target="#modal-newimage" id="btn-new-img">
                                                        <i class="fas fa-plus">
                                                        </i>
                                                       New
                                                      </button>
                                       
                                         
                                      </div>
                                    </div>
                                    <div class="row" style="margin-top:20px;" id="image-gallery-content">
                                      @foreach ($item->mediaprojects->where('media_type','image')  as $itemimage)
                                      <div class="col-sm-2">
                                        <div  class="image-contain" >
                                          <img src="{{$itemimage->mediastore->image_path }}" class="img-fluid mb-2 image-show" alt="{{ $itemimage->mediastore->caption }}"/>
                                          <input id="edit-{{$itemimage->mediastore->id }}" class="btn btn-xs btn-primary update " type="button" value="Edit" data-toggle="modal" data-target="#modal-editimage">
                                          <input id="del-{{$itemimage->mediastore->id }}" class="btn btn-xs btn-danger delete " type="button" value="Delete" data-toggle="modal" data-target="#modal-delete">
                                      
                                        </div>
                                      </div>
                                      @endforeach                                      
                                    </div>
                                    </div>
                                  <div class="tab-pane fade" id="custom-tabs-four-video" role="tabpanel" aria-labelledby="custom-tabs-four-video-tab">
                                     Vedio tincidunt mi at erat gravida, eget tristique urna bibendum. Mauris pharetra purus ut ligula tempor, et vulputate metus facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus interdum, nisl ligula placerat mi, quis posuere purus ligula eu lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere nec nunc. Nunc euismod pellentesque diam. 
                                  </div>
                                  
                                   
                                </div>
                              </div>
                              <!-- /.card -->
                            </div>


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
    <div class="modal fade" id="modal-newimage">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Add image</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
           <div class="col-sm-6">
            <div class="form-group row">
              <form class="form-horizontal col-sm-12" name="create_image_form" method="POST" action="{{route('mediaproject.store', $item->id)}}" 
                enctype="multipart/form-data" id="create_image_form">
                @csrf
              <div class="col-sm-12">
                <textarea   name="caption" style="width: 100%" id="caption" rows="2"  placeholder="Description" ></textarea>
           
              </div>
          </div>
            <div class="custom-file">
              <input type="file" class="custom-file-input" name="images[]"
              multiple  accept="image/x-png,image/gif,image/jpeg,image/jpg,image/svg,image/webp"   id="images">
              <label class="custom-file-label" id="image_label" for="images">Choose file</label>

              <span id="images-error" class="error invalid-feedback"></span>

          </div>
        </form>
           </div>
           <div class="col-sm-6">
            <img alt="" id="imgshow"
            class="rounded img-thumbnail wd-100p float-sm-right  mg-t-10 mg-sm-t-0"
            src="{{ URL::asset('assets/admin/img/default/1.jpg') }}">

           </div>
           
       
        
            </div>
          </div>
          <div class="modal-footer justify-content-between">
            <button type="button" id="btn-cancel-modal-create" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="submit" name="btn_create_image" id="btn_create_image" class="btn btn-primary" form="create_image_form" >Save</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>


    <div class="modal fade" id="modal-editimage">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Edit image</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
           <div class="col-sm-6">
            <div class="form-group row">
              <form class="form-horizontal col-sm-12" name="update_image_form" method="POST" action="{{route('mediaproject.update','item_Id')}}" 
                enctype="multipart/form-data" id="update_image_form">
                @csrf
              <div class="col-sm-12">
                <textarea   name="caption-edit" style="width: 100%" id="caption-edit" rows="2"  placeholder="Description" ></textarea>
           
              </div>
          </div>
            <div class="custom-file">
              <input type="file" class="custom-file-input" name="image"
              multiple  accept="image/x-png,image/gif,image/jpeg,image/jpg,image/svg,image/webp" id="image">
              <label class="custom-file-label" id="image_label" for="images">Choose file</label>

              <span id="images-error" class="error invalid-feedback"></span>

          </div>
        </form>
           </div>
           <div class="col-sm-6">
            <img alt="" id="imgshow-edit"
            class="rounded img-thumbnail wd-100p float-sm-right  mg-t-10 mg-sm-t-0"
            src="{{ URL::asset('assets/admin/img/default/1.jpg') }}">
           </div>
            </div>
          </div>
          <div class="modal-footer justify-content-between">
            <button type="button" id="btn-cancel-modal-edit" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="submit" name="btn_update_image" id="btn_update_image" class="btn btn-primary" form="update_image_form" >Save</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="modal-delete">
      <div class="modal-dialog  modal-sm">
        <div class="modal-content">
          <div class="modal-body text-center" style="padding-bottom: 5px;	padding-top: 30px;">
            <h4 class="modal-title">{{ __('general.Are you sure',[],'en') }}</h4>
               </div>
          <div class="modal-footer justify-content-between" style="border-top: 0px solid  ">

            <button class="btn ripple btn-secondary"  id="btn-cancel-modal"  data-dismiss="modal" type="button">{{ __('general.cancel',[],'en') }}</button>
         
            <form   name="del_image_form" method="POST" action="{{url('admin/mediastore/destroyimage','ItemId')}}" 
            enctype="multipart/form-data" id="del_image_form">
            @csrf
            @method('DELETE')
            <button class="btn ripple btn-danger " id="btn-modal-del" type="button" >{{ __('general.delete',[],'en') }}</button>
            </form>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
@endsection

@section('js')

    <script src="{{ URL::asset('assets/admin/js/custom/validate.js') }}"></script>
    @once 
<script src="{{ URL::asset('assets/admin/js/custom/project.js') }}"></script>
 @endonce
     
 
    <script>
        var emptyimg = "{{ URL::asset('assets/admin/img/default/1.jpg') }}";
        var imgId = 0;
       
        var editimgurl = "{{url('admin/mediastore/getbyid','ItemId')}}"; 
        var delimgurl = "{{url('admin/mediastore/destroyimage','ItemId')}}"; 
        var galimgurl = "{{url('admin/mediastore/getgallery',$item->id)}}"; 
        $(function() {
        $('.textarea').summernote();
/*
       
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    }); 
*/
        });
    </script>
@endsection
@section('css')
<link href="{{URL::asset('assets/admin/css/custom/content.css')}}" rel="stylesheet">
@endsection
