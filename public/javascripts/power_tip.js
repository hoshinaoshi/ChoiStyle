$(function(){
    // TOP画面
    $('.login-mail').data('powertip', "こちらに入力したアドレス宛てに<br/>確認メールを送信します。<br/>迷惑メールボックスに入る可能性もありますので<br/>ご確認ください");
    $('.login-mail').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    $('.login-pass').data('powertip', "8文字以上の半角英数字を入力してください。");
    $('.login-pass').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    /*
    $('.search_demo').data('powertip', '<img alt="カットモデル検索" src="/images/icons/search_demo.png" title="カットモデル検索">');
    $('.search_demo').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true,
      smartPlacement:true
    });
    $('.offer_demo').data('powertip', '<img alt="オファー機能" src="/images/icons/offer_demo.png" title="オファー機能">');
    $('.offer_demo').powerTip({ 
      placement: 'se',
      mouseOnToPopup: true,
      smartPlacement:true
    });
    $('.chat_demo').data('powertip', '<img alt="チャット機能" src="/images/icons/chat_demo.png" title="チャット機能">');
    $('.chat_demo').powerTip({ 
      placement: 's',
      mouseOnToPopup: true,
      smartPlacement:true
    });
    */

    //カットモデル情報変更
    $('.style_text').data('powertip', "スタイリストの方にどのような髪型にしてほしいですか？");
    $('.style_text').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    $('.can_style_text').data('powertip', "スタイリストにどんなパーマ<br/>カラーは何色に<br/してもらいたいですか？>");
    $('.can_style_text').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    $('.image_upload').data('powertip', "顔写真を登録するとオファーされやすくなるかもしれません");
    $('.image_upload').powerTip({ 
      placement: 's',
      mouseOnToPopup: true
    });

    //スタイリスト情報変更
    $('.style_text_of_stylist').data('powertip', "カットモデルの方をどのような髪型にしたいですか？");
    $('.style_text_of_stylist').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    $('.can_style_text_of_stylist').data('powertip', "カットモデルを<br/>どんなパーマ<br/>カラーは何色に<br/>仕上げたいですか？");
    $('.can_style_text_of_stylist').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });
    $('.image_upload_of_stylist').data('powertip', "顔写真を登録するとオファーされやすくなるかもしれません");
    $('.image_upload_of_stylist').powerTip({ 
      placement: 's',
      mouseOnToPopup: true
    });
    
    //美容室情報変更
    $('.image_upload_of_salon').data('powertip', "店内の写真を登録をしてください<br/>店内の写真があることでカットモデルが<br/>安心感を抱くかもしれません");
    $('.image_upload_of_salon').powerTip({ 
      placement: 's',
      mouseOnToPopup: true
    });

    //共通
    $('.salon_location').data('powertip', "美容室の住所を入力いただくと<br/>カットモデルが、あなたを検索したときに</br>お店の場所がGoogleMapに表示されます。");
    $('.salon_location').powerTip({ 
      placement: 'e',
      mouseOnToPopup: true
    });

    //チャット
    $('.chat-msg').data('powertip', "日時や希望の施術などをお伝えください。<br/>また、メッセージの下にある画像送信機能を使って、<br/>ヘアカタログの写メを送信してみましょう。");
    $('.chat-msg').powerTip({ 
      placement: 'w',
      mouseOnToPopup: true
    });
    //表示順位変更
    $('.order_amount_input').data('powertip', "1日あたりの費用です");
    $('.order_amount_input').powerTip({ 
      placement: 's',
      mouseOnToPopup: true
    });
});
