$(document).on('turbolinks:load', function() {

	var fillDivs = $('.fill-div')
	var colors = ['#66ffff', '#66ff66', '#ff9933', '#6699ff']
	var playButtons = $('.played-btn')
	var fillDiv
	var timer


	fillDivs.map(function(i, div) {
		setWidth(div)
		setColor(div, i)
	})

	function setWidth(div) {
		div.style.width = div.dataset.fill + '%'
	}

	function setWidthAjax(div, width) {
		div.style.width = width + '%'
	}

	function setColor(div, i) {
		div.style.backgroundColor = colors[i % colors.length]
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
		fillDiv = e.target.parentElement.children[0].children[3]
		$.ajax({
			url: '/assignments/' + e.target.dataset.id + '/practices',
			type: 'POST'
		}).done( function(response) {
			setWidthAjax(fillDiv, response.fill)
			setDisabled()

		})
	})



})