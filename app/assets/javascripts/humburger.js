$(document).on('turbolinks:load', ()=> {

  $('.nav_toggle').on('click', function () {
    $('.nav_toggle, .nav').toggleClass('show');
  });

});