// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load cocoon:after-insert', function() {

  var $rmv = $('.bt-remove-item');

  $rmv.on('click', function(e){
    $(this).parent('.container-remote-item').parent('.remove-item').hide();
  });

  // $('.remove-item').on('cocoon:before-insert', function(e, insertedItem) {
  //   console.log(insertedItem);
  // });

});
