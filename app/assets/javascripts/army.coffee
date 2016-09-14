$(document).on 'turbolinks:load', ->
	$('form').on 'click', '.remove_fields', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('fieldset').hide()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()

	$('form').on 'click', '.toggle_hide', (event) ->
		$(this).parent().next().toggle('slow')
		event.preventDefault()

	$('body').on 'click', '.toggle_hide_pps', (event) ->
		$(this).parent().parent().next().toggle('slow')
		event.preventDefault()

	$('[data-toggle="tooltip"]').tooltip()