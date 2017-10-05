// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets



function closeThis(elem){
  $(elem).fadeOut(800)
}

function showAlert(cls, text){
  $('.alert').hide(1)
  var alert = $(`.alert.alert-${cls}`)
  alert.find('#text').text(text)
  alert.fadeIn(800)

}
function sendXHR(method, url, data, success){
  $.ajax({
    method: method,
    url: url,
    data: data,
    success: success,
  })
}

function changeIcon(elem, cls){
  var class_arr = elem.attr('class').split(' ')
  for (var i in class_arr){
    var clas = class_arr[i]
    if (clas.substr(0,10)=='glyphicon-'){
      var oldC = clas
      var newC = clas.replace(clas.substr(10),cls)
      elem.addClass(newC)
      elem.removeClass(oldC)

      elem.mouseout(function(){
        elem.addClass(oldC)
        elem.removeClass(newC)
      })
      break
    }
  }
}
