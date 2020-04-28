$(document).on('turbolinks:load', ()=> {

  $('.navtoggle').on('click', function () {
    $('.navtoggle, .nav').toggleClass('show');
  });

});