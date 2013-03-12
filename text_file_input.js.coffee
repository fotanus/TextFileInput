$(document).ready ->
  $('input[type="file"]').each initializeFileInput
  $('.file_label').click( () ->
    $(this).prev().children().first().click()
  ).show()

initializeFileInput = () ->
  fileInput = $(this)
  invisible = $('<div/>').css({height:0,width:0,'overflow':'hidden'})
  label = $('<div class="file_label">Chose file</div>')
  fileInput.after(label).wrap(invisible)

  fileInput.change () ->
    t= $(this)
    t.parent().next().text("New file: " + t.val())
