$(function(){
	$("form")
	.bind("ajax:beforeSend", function(){
		$("#loader").removeClass("hidden")
	})
	.bind("ajax:complete", function(){
		$("#loader").addClass("hidden")
	})
})