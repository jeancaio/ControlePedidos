// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {

  var $rmv = $('.bt-rmv-ass');

  $rmv.on('click', function(){
    $( ".ass-prod" ).remove();
    $( ".ctn-bt-rmv-ass" ).remove();
    console.info
  });

});
