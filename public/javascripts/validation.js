$(function(){
  // TOPページ
  $('#login-mail').blur(function(){
    var text = $(this).val();
    if(text.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#login-pass').blur(function(){
    var text = $(this).val();
    if(text.match(/[a-zA-Z0-9]+$/) && text.length >= 8 && text.length <= 250){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#login-repass').blur(function(){
    var re_text = $(this).val();
    var text = $("#login-pass").val();
    if(re_text.match(/[a-zA-Z0-9]+$/) && re_text.length >= 8 && text.length <= 250 && text == re_text){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#sing-up-button').click(function(){
     $('#login-name').blur();
     $('#login-pass').blur();
     $('#login-repass').blur();
    if($(".control-group").get(0).getAttribute("class").indexOf("error") > 0){
      alert("入力したメールアドレスに誤りがあります")
      return false;
    }
    if($(".control-group").get(1).getAttribute("class").indexOf("error") > 0){
      alert("入力したパスワードに誤りがあります。パスワードは半角英数字で8文字以上入力してください。")
      return false;
    }
    if($(".control-group").get(2).getAttribute("class").indexOf("error") > 0){
      alert("入力したパスワードと確認パスワードが異なります。")
      return false;
    }
    if(!$("#terms_check:checked").val()){
      alert("利用規約に同意するにチェックしてください。")
      return false;
    }
    alert("入力したアドレス宛てに登録メールを送信しました。メールに記載しているURLをクリックしてください。")
  });
  // _base_data
  $('#name,#nick_name,#stylist_name,#stylist_nick_name,#offer_subject').blur(function(){
    var text = $(this).val();
    if(text.length >= 1 && text.length <= 127){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#user-change-submit,#stylist-register-submit').click(function(){
     $('#name').blur();
     $('#nick_name').blur();
     $('#stylist_name').blur();
     $('#stylist_nick_name').blur();
    if($(".control-group").get(0).getAttribute("class").indexOf("error") > 0){
      alert("氏名を入力してください。")
      return false;
    }
    if($(".control-group").get(1).getAttribute("class").indexOf("error") > 0){
      alert("ニックネームを入力してください。")
      return false;
    }
  });
  // スタイリスト
  $('#user_stylist_attributes_salon_url,#user_salon_attributes_salon_url').blur(function(){
    var text = $(this).val();
    if(text == "http://" || (text.match(/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- ./?\%\&=]*)?/) && text.length <= 250) ){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#user_stylist_attributes_salon_tel,#user_salon_attributes_salon_tel').blur(function(){
    var text = $(this).val();
    if(text.length == 0 || (text.match(/\d+[\-ー]?\d+[-ー]?\d+/) && text.length <= 13) ){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#user_stylist_attributes_salon_zip,#user_salon_attributes_salon_zip,#billing_zip').blur(function(){
    var text = $(this).val();
    if(text.length == 0 || (text.match(/\d{3}[\-ー]?\d{4}/) && text.length <= 8) ){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#user-change-submit').click(function(){
    $('#user_stylist_attributes_salon_url').blur();
    $('#user_stylist_attributes_salon_tel').blur();
    $('#user_stylist_attributes_salon_zip').blur();
    $('#user_salon_attributes_salon_url').blur();
    $('#user_salon_attributes_salon_tel').blur();
    $('#user_salon_attributes_salon_zip').blur();
    if($(".control-group").get(0).getAttribute("class").indexOf("error") > 0){
      alert("サイトURLが不正です。")
      return false;
    }
    if($(".control-group").get(1).getAttribute("class").indexOf("error") > 0){
      alert("電話番号が不正です。")
      return false;
    }
    if($(".control-group").get(2).getAttribute("class").indexOf("error") > 0){
      alert("郵便番号が不正です。")
      return false;
    }
  });
  //請求書
  $('#order-submit').click(function(){
    $('#billing_zip').blur();
    if($(".control-group").get(0).getAttribute("class").indexOf("error") > 0){
      alert("郵便番号が不正です。")
      return false;
    }
  });
  // オファー
  $('#offer_content').blur(function(){
    var text = $(this).val();
    if(text.length >= 1){
      $(this).parent().removeClass("error")
    }else{
      $(this).parent().addClass("error")
    }
  });
  $('#offer-submit').click(function(){
    $('#offer_subject').blur();
    $('#offer_content').blur();
    if($(".control-group").get(0).getAttribute("class").indexOf("error") > 0){
      alert("件名を入力してください。")
      return false;
    }
    if($(".control-group").get(1).getAttribute("class").indexOf("error") > 0){
      alert("送信内容を入力してください。")
      return false;
    }
  });
});
