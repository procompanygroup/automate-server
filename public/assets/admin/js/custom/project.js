
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
        sendform('#'+formid);
        });
//get image to edit
		$('.update').on('click', function (e) {
			e.preventDefault();	 
			imgId=$(this).attr("id");
			imgId=imgId.replace("edit-","");
			loadImageInfo(imgId);

			});
			function loadImageInfo(imageId) {
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
						$('#imgshow-edit').attr('src',data.image_path);
						$('#caption-edit').html(data.caption);
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
			sendform('#'+formid);
			});
        function sendform(formid) {
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
			updateimage('#'+formid);
			});
		function updateimage(formid) {
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

// delete image

$('.delete').on('click', function (e) {
	e.preventDefault();	 
	imgId=$(this).attr("id");
	imgId=imgId.replace("del-","");
	 

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

});
