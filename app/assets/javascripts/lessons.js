$(document).on('turbolinks:load', function() {
	console.log('this is happening')

	var fillDivs = $('.fill-div')
	var colors = ['#66ffff', '#66ff66', '#ff9933', '#6699ff']

	fillDivs.map(function(i) {
		var div = fillDivs[i]
		setHeight(div)
		setColor(div, i)
	})

	function setHeight(div) {
		div.style.height = div.dataset.fill + '%'
	}

	function setColor(div, i) {
		div.style.backgroundColor = colors[i % colors.length]
	}

})