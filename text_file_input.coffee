chooseFileText = "Choose a file"

$(document).ready ->
  $('input[type="file"]').each initializeFileInput

initializeFileInput = () ->
  realFileInput = $(this)
  label = $('<div class="file-input-button">'+chooseFileText+'</div>')
  invisibleWrapper = $('<div></div>').css({height:0,width:0,'overflow':'hidden'})
  customFileInputWrapper = $('<div class="custom-file-input"></div>')

  realFileInput.wrap(customFileInputWrapper).after(label).wrap(invisibleWrapper)

  realFileInput.change () ->
    fileNameList = $(this).parent().parent().find('.file-name')
    if fileNameList.length > 0
      fileNameList.first().text($(this).val())
    else
      fileName = $('<div class="file-name">'+$(this).val()+'</div>')
      label.after(fileName)

  label.click () ->
    label.prev().children().first().click()
