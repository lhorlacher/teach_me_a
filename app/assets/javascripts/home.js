$(document).on('turbolinks:load', function() {

	// TO EQUALIZE DIV HEIGHTS PER VIEW

	function setAssignmentHeights() {
		var wellHeight = '0px';
		var allDone = 0;

		$(".btn-well").each(function(i, div){
		   if (toNum($(this).css('height')) > toNum(wellHeight)) { 
		   		wellHeight = $(this).css('height'); 
		   }
		   allDone ++;
		   if (allDone === $('.btn-well').length) {
		   		console.log(wellHeight)
				$(".btn-well").css('height', wellHeight);
		   }
		});

		function toNum(px) {
			array = px.split('')
			array.pop()
			array.pop()
			return Number(array.join(''))
		}
	}

	setAssignmentHeights()

});