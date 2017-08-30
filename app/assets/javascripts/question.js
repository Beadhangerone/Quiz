
$(document).ready(function(){
  // set vars
  $('.variant').click(function(){
    $('.variant').removeClass('checked')
    $(this).addClass('checked')
  })

  // set done btn
  $('#done-btn').click(function(){
    var checked = $('.checked')[0]
    if(checked){
      $.post(document.location,
        { answ_id: $(checked).attr('data-var-id') },
        function success(data){
          var right = data['rightA']
          var client = data['clientA']
          var nextQPath = data['nextQPath']
          $(`.variant[data-var-id=${right}]`).addClass('right')

          if(client == right){
            showAlert('success', 'You are right!')
          }else{
            $(`.variant[data-var-id=${client}]`).addClass('wrong')
            showAlert('danger', 'You are wrong!')
          }

          $('.variant').unbind('click')
          var done = $('#done-btn')
          done.unbind('click')
          done.find('h4').text('Next Question')
          done.click(function(){
            window.location.href = nextQPath
          })

      })
    }else{
      showAlert('wrong', 'Please choose one of the variants!')
    }
  })

});
