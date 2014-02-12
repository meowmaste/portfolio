$(document).ready( function() {
	$("#new_project").on("ajax:success", function(e, data, status, xhr) {
		alert("PROJECT CREATED");
	})

	$("#new_project").on("ajax:error", function(e, data, status, xhr) {
		alert("PROJECT NOT CREATED. TRY AGAIN");
	})
})