// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {

  var fone = $('#mask_phone').find('input');
  var cpf = $('#mask_cpf').find('input');

  cpf.inputmask("999.999.999-99")
  fone.inputmask("(99) 9999-9999[9]");
  //Nono digito
  fone.blur(function(event){
    if($(this).val().length == 15){ // Celular com 9 dígitos + 2 dígitos DDD e 4 da máscara
        $('#fone').inputmask('(00) 00000-0009');
      } else {
        $('#fone').inputmask('(00) 0000-00009');
      }
    });


  $( ".cidade" ).select2({
      theme: "bootstrap"
  });

  



});
