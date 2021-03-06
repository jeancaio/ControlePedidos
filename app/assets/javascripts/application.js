// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery/dist/jquery.min.js
//= require bootstrap.min.js
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require select2
//= require cocoon
//= require_tree .

$(document).on('turbolinks:load', function() {
  $( "#dropdown" ).select2({
      theme: "bootstrap"
    });

  var mensagem = $('.mensagem');
  setTimeout(function(){
    mensagem.fadeOut();
  }, 5000);

  var table = $('.table').find('tbody > tr[data-link]');
  table.on('mouseenter mouseleave', function(){
    $(this).toggleClass('td');
  });

  table.on('click', function(){
    window.location = $(this).data("link")
  });


  var app = $('.table').find('tbody')
  app.css('display', 'none');
  app.fadeIn(500);


});
