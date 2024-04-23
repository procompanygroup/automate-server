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
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Sort Languages</h3>
              </div>
            
              <!-- sort-->
              <div class="card">
                <div class="header body">
                    <h2>
                        Post Sort
                        <small>Drag & drop hierarchical list with mouse and touch compatibility</small>
                    </h2>
                    <div class="form-group row" id="errormsg">
                    </div>
                  
                        <!-- parent_id end --> 
                        
                         
                              </div>
                   
                              <!-- /.card-body -->
                   
                </div>
                <div class="body">
                    <div class="clearfix m-b-20" >
                        
                          <div class="dd" id="sortbody"><ol class="dd-list"><li class="dd-item" data-id="1"><div class="dd-handle">العربية</div></li><li class="dd-item" data-id="3"><div class="dd-handle">English</div></li><li class="dd-item" data-id="4"><div class="dd-handle">French</div></li></ol></div>
                       
                    </div>
                    <!--
                    <b>Output JSON</b>
                    <textarea cols="30" rows="3" class="form-control no-resize" readonly>[{"id":1},{"id":2,"children":[{"id":3},{"id":4},{"id":5,"children":[{"id":6},{"id":7},{"id":8}]},{"id":9},{"id":10}]},{"id":11},{"id":12}]</textarea>
                -->
                  </div>
                <div class="card-footer">
                  <button type="button" name="btn_savepostsort" id="btn_savepostsort" class="btn btn-info">Save</button>
                  <a class="btn btn-default float-right" href="">Cancel</a>
            
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
<script src="{{ URL::asset('assets/admin/plugins/nestable/jquery.nestable1.js')}}"></script>
<script src="{{ URL::asset('assets/admin/js/pages/ui/sortable-nestable.js')}}"></script>
    <script src="{{ URL::asset('assets/admin/js/custom/social.js') }}"></script>
    <script>
      var urlval='';
  //var urlval='{{url("admin.language.updatesort",[0]) }}';
  $(function () {
  //  $('#sortbody').html('');
 
     function sortLang() {
//var urlget='{{url("cpanel/language/getsort")}}'; 
var urlget='';
 //alert(urlget);
 
        $.ajax({
          //  url: "{{url('cpanel/category/updatesort/',["+parentid+"])}}",   
          url: urlget,              
          type: "GET",         
          contentType: 'application/json',
            success: function(data){
              $('#errormsg').html('');
              $('#sortbody').html('');
               if(data.length==0){
                $('#sortbody').html('No Data');
               }else{
                fillsortlist(data, $('#sortbody'));
               }
        
             // $('.alert').html(result.success);
            },
            error: function(jqXHR, textStatus, errorThrown) {
             alert(jqXHR.responseText);
              // $('#errormsg').html(jqXHR.responseText);
              $('#errormsg').html("Error");
            }
        
        });

    };
   // sortLang();
    function fillsortlist(data,$root) {
      /*
      $.each(data, function(i, item) {
                $('#sortbody').append(item.id+':'+item.title+',parent:'+item.parent_id+'-');
              });
              */
              var $ul = $('<ol class="dd-list">');

$.each(data, function(_,item) {
  var $li = $('<li class="dd-item" data-id="'+item.id+'">');
    var $btncollapse = $('<button data-action="collapse" type="button" style="display: block;">').text('Collapse');
      var $btnexpand = $('<button data-action="expand" type="button" style="display: none;">').text('Expand');
        if (item.children && item.children.length) {
          $li.append($btncollapse);
          $li.append($btnexpand);
        }
    var $divhandle = $('<div class="dd-handle">').text(item.name);
      $li.append($divhandle);
  if (item.children && item.children.length) {
    $li.append(fillsortlist(item.children));
  }

  $ul.append($li);
});

return $root ? $root.html($ul) : $ul;
    }


    /*
 function fillsortlist(data,$root) {
  
              var $ul = $('<ul>');

$.each(data, function(_,   item) {
  var $li = $('<li>').text(item.title);

  if (item.children && item.children.length) {
    $li.append(fillsortlist(item.children));
  }

  $ul.append($li);
});

return $root ? $root.html($ul) : $ul;
    }
    */
});
</script>
@endsection
@section('css')
  <!-- JQuery Nestable Css -->
  <link href="{{ URL::asset('assets/admin/plugins/nestable/jquery-nestable.css')}}" rel="stylesheet" />
@endsection
