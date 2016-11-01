
// $(document).on('turbolinks:load', function() {

// 	var changes = false
// 	var fields = $('.form-control')


// 	for(var i = 0; i < fields.length; i++) {
// 		setReadOnlyTrueListener(fields[i])
// 	}
// 	function setReadOnlyTrueListener(field) {
// 		field.addEventListener('dblclick', function(e){
// 			console.log('clicked')
// 			var field = e.target
// 			field.readOnly = false
// 			field.focus()
// 			var originalValue = field.value
// 			setReadOnlyFalseListener(field, originalValue)
// 		})
// 	}

// 	function setReadOnlyFalseListener(field, originalValue) {
// 		field.addEventListener('blur', function(e){
// 			var tempScrollTop = $(window).scrollTop();
// 			var input = e.target
// 			input.readOnly = true
// 		})
// 	}

// 	window.addEventListener('turbolinks:before-unload', checkForChanges() )

// 	function checkForChanges(changesboolean) {
// 		if(changesboolean === true) {
// 			$('form').submit()
// 			console.log('changes registering true')
// 			return confirm('Are you sure?')
// 		}
// 	}


// })
