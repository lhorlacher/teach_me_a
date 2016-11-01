$(document).on('turbolinks:load', function() {
	var changes = false
	var fields = $('.form-control')

	for(var i = 0; i < fields.length; i++) {
		setReadOnlyTrueListener(fields[i])
	}

	function setReadOnlyTrueListener(field) {
		field.addEventListener('dblclick', function(e){
			console.log('clicked')
			var field = e.target
			field.readOnly = false
			field.focus()
			var originalValue = field.value
			setReadOnlyFalseListener(field, originalValue)
		})
	}

	function setReadOnlyFalseListener(field, originalValue) {
		field.addEventListener('blur', function(e){
			var input = e.target
			input.readOnly = true
			if (originalValue !== input.value) {
				changes = true
			}
		})
	}
	function confirmLeave() {
		console.log('event is firing')
		if(changes === true) {
			changes === false
			return 'You have unsaved changes!'
		}
	}
	window.onbeforeunload = function(){
		console.log('this is happening')
  return 'Are you sure you want to leave?';
};

})
