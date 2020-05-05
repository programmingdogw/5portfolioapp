$(document).on('turbolinks:load', ()=> {
  $('.js-menu__item').each(function(){
      $(this).on('click',function(){
          $("+.submenu",this).slideToggle();
          return false;
      });
  });
});