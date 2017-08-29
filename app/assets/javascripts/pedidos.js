// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load cocoon:after-insert', function() {

  var $rmv = $('.bt-remove-item');
  var liberar = $('#liberar');

  $rmv.on('click', function(e){
    var pai = $(this).parent('.container-remote-item').parent('.remove-item')
    pai.fadeOut();
    setTimeout(function(){
      pai.remove();
    },1000);
  });

  liberar.on('click', function(e, status){

    console.log(status);
  });
  // $('.remove-item').on('cocoon:before-insert', function(e, insertedItem) {
  //   console.log(insertedItem);
  // });

});
