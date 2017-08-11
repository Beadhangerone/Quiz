
$(document).ready(function(){
  // set vars
  $('.variant').click(function(){
    $('.variant').removeClass('checked')
    $(this).addClass('checked')
  })

  // set done btn
  $('#done').click(function(){
    var checked = $('.checked')[0]
    if(checked){
      jQuery.post(`${document.location}?answ_id=${$(checked).attr('data-var-id')}`)
    }
  })

});
