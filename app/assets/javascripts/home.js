$(document).on('turbolinks:load', ()=> {

  function appendList(category){
    var html = `<li class="toppage-childcategory toppage-grandchildcategory" data-category="${category.id}"><a href="#">${category.name}</a></li>`;
    return html;
  }

  function appendChildrenList(insertHTML){
  var childListHtml = '';
  childListHtml = `
                  ${insertHTML}                                                 
                  `;
  $('.childrenul').append(childListHtml);
  }
  
  
  // 親カテゴリー選択後のイベント
  $('.toppage-parentcategory').on('mouseenter', function(){
    var parentCategory = $(this).data('parentname')

      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        console.log(children)
        $('.toppage-childcategory').remove(); //親が変更された時、子以下を削除する        
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendList(child);
        });
        appendChildrenList(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    
  });


});



// 参考用大枠外
// function appendOption(category){
//   var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
//   return html;
// }

// function appendChildrenBox(insertHTML){
//   var childSelectHtml = '';
//   childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>                        
//                         <select class="listing-select-wrapper__box--select" id="child_category" name="item[childcategory]">
//                           <option value="---" data-category="---">---</option>
//                           ${insertHTML}
//                         <select>                                                 
//                     </div>`;
//   $('.listing-product-detail__category').append(childSelectHtml);
// }