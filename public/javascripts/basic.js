var default_text = "ChoiStyleでは、あなたからのフィードバックをお待ちしています。みなさまから送信されたご意見は全て読んでいます。あなたの不便は、私達が解決し、サイトを利用するみなさまのためになります。ネガティブな意見でも遠慮なくお願いします。"
$(function(){
  // 問い合わせ文字処理
  $('#opinion').focus(function(){
    var text = $(this).val();
    $(this).css("color","#000");
    if(text === default_text){
      $(this).val("");
    }
  }).blur(function(){
    var text = $(this).val();
    if(text){
    }else{
      $(this).css("color","#bdc3c7");
      $(this).val(default_text);
    }
  });
  // 問い合わせ送信処理
  $('#fb-submit').click(function(){
    var text = $("#opinion").val();
    var user_id = $("#opinion_user_id").attr("value")
    if(text === default_text){
      alert("未入力のまま送信はできません")
      return
    }
    $(this).remove();
    $("#opinion").remove();
    var p_tag = document.createElement('h6');
    p_tag.appendChild(document.createTextNode("ご意見ありがとうございます。あなたの意見でこのサイトは確実に良くなるはずです"));
    document.getElementById("opinion-box").appendChild(p_tag);
    $.ajax({
      type: "POST",
      url: "/opinion",
      dataType: "script",
      data: {opinion_content: text, user_id: user_id}
    });
  });

  // メニューボタン
  $('.menu_img').hover(
    function(){
      $(this).animate({opacity: 0.8}, 'fast');
    },function(){
      $(this).animate({opacity: 1}, 'fast');
    }
  );
  
  // 検索順位の設定金額送信
  $('.order-amout-submit').click(function(){
    var id = $(this).attr("value")
    var order_amount = $("#order_amount" + id ).val()
    $("#current-order-omount" + id).text(order_amount)
    $("#order_amount" + id ).remove()
    $("#format" + id ).remove()
    $(this).attr("class","btn disabled btn-large btn-block login_top_btn").text("更新完了")
    $.ajax({
      type: "PUT",
      url: "/mypage/order/"+id,
      dataType: "script",
      data: {order_amount: order_amount, authenticity_token:$("#authenticity_token").val()}
    });
  });

  // 地域セレクトボックスを変えた時
  $('#salon_prefecture').change(function(){
    if($('#salon_area').size()){
      $('#salon_area').val("");
    }
    $('#search_form').submit();
  });
  $('#user_cut_model_attributes_prefecture').change(function(){
    if($('#user_cut_model_attributes_area').size()){
      $('#user_cut_model_attributes_area').val("");
    }
    $('.edit_user').submit();
  });
  $('#user_salon_attributes_salon_prefecture').change(function(){
    if($('#user_salon_attributes_salon_area').size()){
      $('#user_salon_attributes_salon_area').val("");
    }
    $('.edit_user').submit();
  });
  $('#user_stylist_attributes_salon_prefecture').change(function(){
    if($('#user_stylist_attributes_salon_area').size()){
      $('#user_stylist_attributes_salon_area').val("");
    }
    $('.edit_user').submit();
  });
  
  // 同意ボタン処理
  $('.terms_text').click(function(){
    if($("#terms_check:checked").val()){
      $("#terms_check").attr("checked",false)
    }
    else{
      $("#terms_check").attr("checked",true)
    }
  });
});
