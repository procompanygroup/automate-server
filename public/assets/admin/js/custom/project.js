
$(document).ready(function () {

 
	$('#btn_cancel').on('click', function (e) {
	 

		resetForm();
		ClearErrors();
	});
	
	$('#btn_reset').on('click', function (e) {
		e.preventDefault();
	 	resetForm();
		ClearErrors();
	});
 
	$('#btn_save').on('click', function (e) {
		e.preventDefault();
		startLoading();
		ClearErrors();
		 
		var form = $('#create_form')[0];
		var formData = new FormData(form);
		urlval = $('#create_form').attr("action");
 

		$.ajax({
			url: urlval,
			type: "POST",
			data: formData,
			contentType: false,
			processData: false,
			//contentType: 'application/json',
			success: function (data) {
				//	alert(data);
				endLoading();

				//$('#errormsg').html('');
				//$('#sortbody').html('');
				if (data.length == 0) {
					noteError();
				} else if (data == "ok") {
					noteSuccess();
					resetForm();
					ClearErrors();
				}
 
			}, error: function (errorresult) {
				endLoading();
				var response = $.parseJSON(errorresult.responseText);
				 
				noteError();
				$.each(response.errors, function (key, val) {
					$("#" + key + "-error").text(val[0]);
					$("#" + key).addClass('is-invalid');
				 
				});

			}, finally: function () {
				endLoading();

			}
	 

		});



	});

	$('#btn_update_user').on('click', function (e) {
		e.preventDefault();
		startLoading();
		ClearErrors();
		//var fdata = $( "#create_form" ).serialize();
		var form = $('#create_form')[0];
		var formData = new FormData(form);
		urlval = $('#create_form').attr("action")
	 

		$.ajax({
			url: urlval,
			type: "POST",

			data: formData,
			contentType: false,
			processData: false,
			//contentType: 'application/json',
			success: function (data) {
				//	alert(data);
				endLoading();
				//$('#errormsg').html('');
				//$('#sortbody').html('');
				if (data.length == 0) {
					noteError();
				} else if (data == "ok") {
					noteSuccess();

					ClearErrors();
				}

				// $('.alert').html(result.success);
			}, error: function (errorresult) {
				endLoading();
				var response = $.parseJSON(errorresult.responseText);
				// $('#errormsg').html( errorresult );
				noteError();
				$.each(response.errors, function (key, val) {
					$("#" + key + "-error").text(val[0]);
					$("#" + key).addClass('is-invalid');
					//$('#error').append(key+"-"+ val[0] +"/");
				});

			}, finally: function () {
				endLoading();

			}
		 

		});



	});

    $('.btn_update_trans').on('click', function (e) {
        e.preventDefault();	 
        var formid = $(this).closest('form').attr("id");
        sendform('#'+formid,'trans');
        });
//open new image modal

$('#btn-new-img').on('click', function (e) {
	e.preventDefault();	 
 
	resetForm('#create_image_form');
 

	});
	//open new video
	$('#btn-new-vid').on('click', function (e) {
		e.preventDefault();	 
	 
		resetForm('#create_video_form');
	 
	
		});
		//save new video
		$('#btn_create_video').on('click', function (e) {
			e.preventDefault();	 
			var formid = $(this).attr("form");
			sendform('#'+formid,'video'); 
			});
//get image to edit
		$('.update').on('click', function (e) {
			e.preventDefault();	 
			imgId=$(this).attr("id");
			imgId=imgId.replace("edit-","");
			resetForm('#update_image_form');
			loadImageInfo(imgId,'image');

			});
//get video to edit
$('.update-video').on('click', function (e) {
	e.preventDefault();	 
	imgId=$(this).attr("id");
	imgId=imgId.replace("edit-","");
	resetForm('#update_video_form');
	loadImageInfo(imgId,'video');

	});
			
			function loadImageInfo(imageId,type) {
				startLoading();
			ClearErrors();
			urlval=editimgurl;
			urlval=urlval.replace("ItemId", imageId);			 
					$.ajax({
				url: urlval,
				type: "GET",
	
			//	data: formData,
			//	contentType: false,
			//	processData: false,
				//contentType: 'application/json',
				success: function (data) {
					//	alert(data);
					endLoading();
				
					if (data.length == 0) {
						noteError();
					} else   {
						if(type=='image'){
							$('#imgshow-edit').attr('src',data.image_path);
							$('#caption-edit').html(data.caption);
						//	$("#btn-cancel-modal").trigger("click");
						}else{
							$('#vidshow-edit').attr('src',data.image_path);
							$('#caption-edit-video').html(data.caption);
							//$("#btn-cancel-modal").trigger("click");
						}
					
					//	noteSuccess();
	
					//	ClearErrors();
					}
	
				}, error: function (errorresult) {
					endLoading();
					var response = $.parseJSON(errorresult.responseText);			
					noteError();	
				}, finally: function () {
					endLoading();
				
				}
			});
			}

//


		$('#btn_create_image').on('click', function (e) {
			e.preventDefault();	 
			var formid = $(this).attr("form");
			sendform('#'+formid,'image');
			});
        function sendform(formid,formtype) {
            startLoading();
		ClearErrors();
		//var fdata = $( "#create_form" ).serialize();
		var form = $(formid)[0];
		var formData = new FormData(form);
		urlval = $(formid).attr("action");
        		$.ajax({
			url: urlval,
			type: "POST",
			data: formData,
			contentType: false,
			processData: false,
			//contentType: 'application/json',
			success: function (data) {
				//	alert(data);
				endLoading();
				//$('#errormsg').html('');
				//$('#sortbody').html('');
				if (data.length == 0) {
					noteError();
				} else if (data == "ok") {
					noteSuccess();

					ClearErrors();
if(formtype=='image'){
	loadgallery(formtype) ;
	$("#btn-cancel-modal-create").trigger("click");
}else if(formtype=='video'){
	loadgallery(formtype) ;
	$("#btn-cancel-modal-create-video").trigger("click");
}
					
				}
				// $('.alert').html(result.success);
			}, error: function (errorresult) {
				endLoading();
				var response = $.parseJSON(errorresult.responseText);
				// $('#errormsg').html( errorresult );
				noteError();
				$.each(response.errors, function (key, val) {
					$("#" + key + "-error").text(val[0]);
					$("#" + key).addClass('is-invalid');
					//$('#error').append(key+"-"+ val[0] +"/");
				});

			}, finally: function () {
				endLoading();

			}
		});
        }

		//update
		$('#btn_update_image').on('click', function (e) {
			e.preventDefault();	 
			var formid = $(this).attr("form");
			updateimage('#'+formid,'image');
			});
		function updateimage(formid,type) {
            startLoading();
		ClearErrors();
		//var fdata = $( "#create_form" ).serialize();
		var form = $(formid)[0];
		var formData = new FormData(form);
		 urlact= $(formid).attr("action");
		 urlval=urlact.replace("item_Id", imgId);		 
        	$.ajax({
			url: urlval,
			type: "POST",
			data: formData,
			contentType: false,
			processData: false,
			//contentType: 'application/json',
			success: function (data) {
				//	alert(data);
				endLoading();
				//$('#errormsg').html('');
				//$('#sortbody').html('');
				if (data.length == 0) {
					noteError();
				} else if (data == "ok") {
					noteSuccess();
					ClearErrors();
					loadgallery(type) ;
					if(type=='image'){
						$("#btn-cancel-modal-edit").trigger("click");
					}else{
						$("#btn-cancel-modal-edit-video").trigger("click");
					}
				
					
				}

				// $('.alert').html(result.success);
			}, error: function (errorresult) {
				endLoading();
				var response = $.parseJSON(errorresult.responseText);
				// $('#errormsg').html( errorresult );
				noteError();
				$.each(response.errors, function (key, val) {
					$("#" + key + "-error").text(val[0]);
					$("#" + key).addClass('is-invalid');
					//$('#error').append(key+"-"+ val[0] +"/");
				});

			}, finally: function () {
				endLoading();
			}
		});
        }
///
//update video

$('#btn_update_video').on('click', function (e) {
	e.preventDefault();	 
	var formid = $(this).attr("form");
	updateimage('#'+formid,'video');
	});

// delete image

$('.delete').on('click', function (e) {
	e.preventDefault();	 
	imgId=$(this).attr("id");
	imgId=imgId.replace("del-","");
	delType='image';
	 

	});
	
// delete video

$('.delete-video').on('click', function (e) {
	e.preventDefault();	 
	imgId=$(this).attr("id");
	imgId=imgId.replace("del-","");
	delType='video';
	});

$('#btn-modal-del').on('click', function (e) {
	e.preventDefault();	 
	
	var formid = $(this).closest('form').attr("id");
	delimgform('#'+formid);
 
	});

function delimgform(formid) {
	startLoading();
ClearErrors();
//var fdata = $( "#create_form" ).serialize();
var form = $(formid)[0]; 
var formData = new FormData(form);
 
urlformval = $(formid).attr("action"); 
urlval=urlformval.replace("ItemId", imgId);	
		$.ajax({
	url: urlval,
	type: "POST",
	 data: formData,
	contentType: false,
	processData: false,
	//contentType: 'application/json',
	success: function (data) {
		//	alert(data);
		endLoading();
		//$('#errormsg').html('');
		//$('#sortbody').html('');
		if (data.length == 0) {
			noteError();
		} else if (data == "ok") {
			noteSuccess();

			ClearErrors();
		}
		
		loadgallery(delType) ;
		$("#btn-cancel-modal").trigger("click");
		// $('.alert').html(result.success);
	}, error: function (errorresult) {
		endLoading();
		var response = $.parseJSON(errorresult.responseText);
		// $('#errormsg').html( errorresult );
		noteError();
	

	}, finally: function () {
		endLoading();

	}
});
}
//
//load gallery
function loadgallery(type) {
	urlval='';
	if(type=='image'){
		urlval=galimgurl;
	}else{
		urlval=vidurl;
	}

 		 
		$.ajax({
	url: urlval,
	type: "GET",

//	data: formData,
//	contentType: false,
//	processData: false,
	//contentType: 'application/json',
	success: function (data) {
		//	alert(data);
	//	endLoading();
	
		if (data.length == 0) {
		//	noteError();
		} else   {
			if(type=='image'){
				$('#image-gallery-content').html(data);
			}else{
				$('#video-gallery-content').html(data);
			}
			
		 	
		//	noteSuccess();

		//	ClearErrors();
		}

	}, error: function (errorresult) {
		//endLoading();
		var response = $.parseJSON(errorresult.responseText);			
		//noteError();	
	}, finally: function () {
		//endLoading();
	
	}
});
}


//
function ClearErrors() {

    $('.error').html('');
    $(":input").removeClass('is-invalid');
     
}
function noteSuccess() {
	toastr.success("Sucsess");	 
}
function noteError() {
	toastr.error("Faild");		 
}
$("#images").focusout(function (e) {
	if (!validatempty($(this))) {
		return false;
	} else {

		return true;
	}
});

$("#images").on("change", function () {
	imageChangeForm("#images", "#image_label", "#imgshow");
});
$("#image").on("change", function () {
	imageChangeForm("#image", "#image_label", "#imgshow-edit");
});
$("#image-video").on("change", function () {
	videoChangeForm("image-video", "video_label", "vidshow");
});
$("#image-video-edit").on("change", function () {
	videoChangeForm("image-video-edit", "image_label-video-edit", "vidshow-edit");
});
function imageChangeForm(btn_id, upload_label, imageId) {
	/* Current this object refer to input element */
	var $input = $(btn_id);
	var reader = new FileReader();
	reader.onload = function () {
		$(imageId).attr("src", reader.result);
		//   var filename = $('#photo_edit')[0].files.length ? ('#photo_edit')[0].files[0].name : "";
		var filename = $(btn_id).val().split('\\').pop();
		$(upload_label).text(filename);
	}
	reader.readAsDataURL($input[0].files[0]);

}
function resetForm() {
	jQuery('#create_form')[0].reset();
	$('#image_label').text("Choose File");
	//$('#icon_label').text('اختر ملف SVG');
	$('#imgshow').attr("src", emptyimg);
	$('#imgshow-edit').attr("src", emptyimg);
	 
	//$('#iconshow').attr("src", emptyimg);
}
function resetForm(formId) {
	jQuery(formId)[0].reset();
	$('#image_label').text("Choose File");
	$('#video_label').text("Choose File");
	$('#image_label-video-edit').text("Choose File");
	
	//$('#icon_label').text('اختر ملف SVG');
	$('#imgshow').attr("src", emptyimg);
	$('#imgshow-edit').attr("src", emptyimg);
	$('#vidshow').attr("src", '');
	$('#vidshow-edit').attr("src", '');
	
	//$('#iconshow').attr("src", emptyimg);
}
function videoChangeForm(btn_id, upload_label, videoId) {
 
	const inputFile = document.getElementById(btn_id);
	const video = document.getElementById(videoId);	 
		const file = inputFile.files[0];
		const videourl = URL.createObjectURL(file);
		video.setAttribute("src", videourl);
		var filename = $("#"+btn_id).val().split('\\').pop();
		$("#"+upload_label).text(filename);
	//	video.play();
	 
}

});
