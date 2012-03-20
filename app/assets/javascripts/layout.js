$(function() {
	$(".add_nested_fields, .button").button();
	$(".remove_nested_fields").button({
		icons:{primary:"ui-icon-close"}
	});
	
	$(".date_picker").datepicker(
		{
			changeMonth: true,
			changeYear:true,
			yearRange: '1900:2020',
			defaultDate: '+0d',
			dateFormat: 'yy-mm-dd'
		}
	);
	
});

function behavior(){
	$(".category-list li:even").addClass("listeven");
	$(".category-list li:odd").addClass("listodd");

}

function cerrarModalBox(object)
{
	$(object).find("#form-errors").empty();
}

jQuery.fn.modalBox = function(title, button_text) {
	$(this).dialog({autoOpen:false, modal:true, title: title, resizable: false, width: 500, position: "top", show: "blind", draggable: false, close:cerrarModalBox(this),
	buttons: [
	{
		text: button_text,
		click: function() {				
			$(this).dialog("close");
			$(this).find("form").submit();
		}
		}]
	});
	$(this).keyup(function(e) 
	{
		if (e.keyCode == 13) 
		{
			$(this).dialog("close");

		}
	});
	return this;
};



// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults