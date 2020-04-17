$(document).on('turbolinks:load', ()=> {
  
  // 親カテゴリー選択後のイベント
  $('#toppage-parentcategory').on('click', function(){
    var parentCategory = document.getElementById('toppage-parentcategory').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        console.log("あああ")
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しましたよーーー');
      })
    }else{
      alert('カテゴリー取得に失敗しましたわーー');
    }
  });


});



// 参考用大枠外
// $('#parent_category').on('change', function(){
//   var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
//   if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
//     $.ajax({
//       url: 'get_category_children',
//       type: 'GET',
//       data: { parent_name: parentCategory },
//       dataType: 'json'
//     })
//     .done(function(children){
//       $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
//       $('#grandchildren_wrapper').remove();
//       var insertHTML = '';
//       children.forEach(function(child){
//         insertHTML += appendOption(child);
//       });
//       appendChildrenBox(insertHTML);
//     })
//     .fail(function(){
//       alert('カテゴリー取得に失敗しました');
//     })
//   }else{
//     $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
//     $('#grandchildren_wrapper').remove();
//   }
// });