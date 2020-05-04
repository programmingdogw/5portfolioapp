$(document).on('turbolinks:load', ()=> {

  // 編集ページ用のフォームクリア
  $('.js-file_group_wrapper').remove()

  // 画像用のinputを生成する関数
  const buildFileField = function(index){
    
    const html = `
                  
                  <div data-index="${index}" class="js-file_group">
                    <i class="fas fa-camera"></i>画像
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    <strong class="js-remove">削除</strong>
                  </div>
                  
                  `;
    return html;
  };

  // プレビュー用の画像をビルド
  const buildImg = (index, url)=> {
    const html = `
    <img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  };



  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 編集ページでクリアしたフォームを再生成
  if ($('.js-file_group').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));



  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 削除ボックス隠しとく
  $('.hidden-destroy').hide();

  // フォームに変更があると次のフォームを作成
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // プレビューは枚数制限外した方がわかり易そうだったからとりあえずコメントアウトしてる
      // if($('img').length <= 11){
        $('#previews').append(buildImg(targetIndex, blobUrl));
      // }
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    

    $('strong').show()
    $('strong:last').hide()

  });
  
  
  $('#image-box').on('click', '.js-remove', function() {
    
    // 最後の削除ボタン、つまり新規投稿用の値の入っていないボタンが削除された時は反応させない。
    // 新規フォームが作成されなくなる問題を防ぐため
    if (($('.js-remove').index(this)) == ($('.js-remove').length) - 1){
      console.log('新規投稿用のフォームは消さない')
    }else{

            const targetIndex = $(this).parent().data('index')
            // 該当indexを振られているチェックボックスを取得する
            const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
            // 削除を押した時、もしチェックボックスが存在すればチェックを入れる。:_destroyを送るため
            if (hiddenCheck) hiddenCheck.prop('checked', true);
            // 削除を押すとjs-file_groupを削除
            $(this).parent().remove();
            // imgも削除
            $(`img[data-index="${targetIndex}"]`).remove();
            
            

            // 画像入力欄が0個にならないようにしておく
            if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

          }

  });


  

  //画像がない時はボタンが無効に。画像がある時は有効に.
  $('#itembtn').on('mouseenter', function() {
    if ($('img').length == 2) {
      $("#itembtn").attr("disabled", true);
    }
    // 11枚以上の時も同様に押せないようにした
    if ($('img').length >= 13) {
      $("#itembtn").attr("disabled", true);
    }
  });
  // 恐らくページ読み込み時に長さを取得してるため、上の有効化処理がマウスオーバーで発火しないので、
  // 画像ファイルに変化があるか、削除ボタンを押せば発火してボタン有効化してる
  $('#image-box').on('change', '.js-file', function(e) {
    $("#itembtn").attr('disabled', false);
  });
  $('#image-box').on('click', '.js-remove', function(e) {
    $("#itembtn").attr('disabled', false);
  });


  
  // 編集ページ用のボタン処理作成中(下のロジックだと時間差発生することがあったので改修)
  if ($('.preserved-remove').length == 1) {
    $(".preserved-remove").hide();
  }

  // 編集ページ用のボタン処理作成中（基本的に上が発火するが保険で一応残してる）
  $('img').on('mouseenter', function() {
   
    if ($('.preserved-remove').length == 1) {
      $(".preserved-remove").hide();
    }
  });

  
  

  // こっから先はカテゴリーのフォームに関する記述

  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                          <label class="listing-default__label" for="item_childcategory">                        
                            <select class="listing-select-wrapper__box--select" id="child_category" name="item[childcategory]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                          </label>
                          <i class="fas fa-chevron-down decoratedchevron"></i>                                                 
                      </div>
                      `;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成 
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                                <label class="listing-default__label" for="item_category_id">                            
                                  <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </label>
                                <i class="fas fa-chevron-down decoratedchevron"></i>                                                           
                            </div>
                            `;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.listing-product-detail__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });

  // 編集ページの二段目が初めて押された時だけフォームをクリアするメソッド
  $('.listing-product-detail__category').on('click', '.special-class-for-reset', function(){
    $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
    $('#grandchildren_wrapper').remove();
  });

});
