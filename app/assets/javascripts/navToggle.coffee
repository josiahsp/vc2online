<<<<<<< HEAD
$(document).on "turbolinks:change turbolinks:load", ->
	$('#navbutton').click ->
		$('#navmenu').toggleClass('visible')
		$('#navbutton').toggleClass('accent-text')
=======
$(document).on "ready page:change", ->
	$('#navbutton').click ->
		$('#navmenu').toggleClass('visible')
>>>>>>> be4d248d05bb7a93b47eccdce1d4c49a57e15414
