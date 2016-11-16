$(document).on('turbolinks:load', function() {

	var fillDivs = $('.fill-div')
	var colors = ['#66ffff', '#66ff66', '#ff9933', '#6699ff']
	var playButtons = $('.played-btn')
	var fillDiv
	var timer



// LESSON SHOW/ASSIGNMENT INDEX PAGE
	fillDivs.map(function(i, div) {
		setWidth(div)
		setColor(div)
	})

	function setWidth(div) {
		div.style.width = div.dataset.fill + '%'
	}

	function setWidthAjax(div, width) {
		console.log(div)
		console.log(width)
		div.style.width = width + '%'
	}

	function setColor(div) {
		if (div.style.width === '100%'){
			var $div = $(div)
			console.log('heyo')
			$div.removeClass('grad')
			$div.addClass('green')
			div.nextElementSibling.innerHTML = 'COMPLETE'
		}
	}

	function setActive() {
		playButtons.map(function(i, button) {
			button.disabled = false
		})
	}

	function setDisabled() {
		playButtons.map(function(i, button) {
			button.disabled = true
		})
		setTimeout(setActive, 2000)
	}

	$(".played-form").submit(function(e) {
		e.preventDefault()
		fillDiv = e.target.parentElement.children[0].children[5]
		$.ajax({
			url: '/assignments/' + e.target.dataset.id + '/practices',
			type: 'POST'
		}).done( function(response) {
			setWidthAjax(fillDiv, response.fill)
			setColor(fillDiv)
			setDisabled()

		})
	})

// LESSON INDEX PAGE
	google.charts.load('current', {'packages':['corechart']});


	if ($("#lessons-chart-div").length) {
		var chartData = JSON.parse(document.getElementById('lessons-chart-div').innerHTML)

		google.charts.setOnLoadCallback(drawLessonIndexChart);

		function drawLessonIndexChart() {
	        // Create the data table.
	        var data = new google.visualization.arrayToDataTable(
				chartData
	        );

			// Set chart options
			var options = { vAxis: {minValue: 0, maxValue: 100}, legend: {position: 'bottom'}, chartArea: {right: '2px', width: '80%'} }

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.LineChart(document.getElementById('lessons-chart-div'));
			chart.draw(data, options);
	    }

	    $(window).resize(function(){
	      drawLessonIndexChart()
	    });
	}

	$('select').selectpicker();


	// RESTORE COMPLETE WELL IF BUTTONS NOT PRESENT
	($('.card-btn').length) ? null : ($('div').removeClass( 'btn-well' ).addClass( 'top-margin' ));

})