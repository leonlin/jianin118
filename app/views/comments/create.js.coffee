$('<%= if @flag then escape_javascript(render(:partial => @comment)) end %>')
  .appendTo('#comments')
  .hide()
  .fadeIn()
$('#new_comment')[0].reset()
$('#comments_count').html 'Comments(<%= Comment.count %>)'
$('#error_explanation').remove()
$('<%= escape_javascript(render "shared/error_messages", object: @comment) %>').prependTo('#new_comment').hide().fadeIn()
Recaptcha.create('6LdtAtgSAAAAAKRM_c7ebgYlyTQXxalqvUeeipZW', document.getElementById('dynamic_recaptcha') , '')

