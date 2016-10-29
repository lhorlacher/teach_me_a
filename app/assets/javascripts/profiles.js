// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	fields = $('.form-control')

	for(var i = 0; i < fields.length; i++) {
		setReadOnlyTrueListener(fields[i])
	}

	function setReadOnlyTrueListener(field) {
		console.log('click event added to:')
		console.log(field)
		field.addEventListener('dblclick', function(e){
			var field = e.target
			field.readOnly = false
			field.focus()
			setReadOnlyFalseListener(field)
		})
	}

	function setReadOnlyFalseListener(field) {
		field.addEventListener('blur', function(e){
			e.target.readOnly = true
		})
	}

})
