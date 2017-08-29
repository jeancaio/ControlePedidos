// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load cocoon:after-insert', function() {

  var mask_money = $('.mask_money');

  mask_money.on('click', function(e){

  mask_money.inputmask("999.99");
    console.log(mask_money.val());
  });
});
