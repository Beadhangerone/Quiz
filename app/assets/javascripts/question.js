
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
      jQuery.post(document.location,
        { answ_id: $(checked).attr('data-var-id') },
        function success(data){
          var right = data['rightA']
          var client = data['clientA']
          $(`.variant[data-var-id=${right}]`).addClass('right')
          if(client == right){
            showAlert('green', 'You are right!')
          }else{
            $(`.variant[data-var-id=${client}]`).addClass('wrong')
            showAlert('red', 'You are wrong!')
          }

      })
    }else{
      showAlert('red', 'Please chose one of the variants!')
    }
  })

});
