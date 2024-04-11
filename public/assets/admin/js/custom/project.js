
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
///
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
});
