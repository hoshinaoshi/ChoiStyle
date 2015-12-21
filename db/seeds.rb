10.times do |no|
  user = User.create!(
    last_name: "性#{no}",
    first_name: "名#{no}",
    nick_name: "ニックネーム#{no}",
    user_type: 0,
    gender: "0",
    prefecture: "0",
    email: "#{no}@#{no}.jp",
    password: "$2a$10$R1lmG6HDxJiIk8eMNX2S2.uxgR0rejsMGVKlRa96yTDMcgVg4uLOe",
  )
  cut_model = user.build_cut_model
  cut_model.hair_long = 0
  cut_model.hair_type = 0
  cut_model.volume = 0
  cut_model.wavy = 0
  cut_model.when_parm = 0
  cut_model.when_color = 0
  cut_model.want_long = 0
  cut_model.want_style = 0
  cut_model.want_style_text = "どんなスタイル詳細#{no}"
  cut_model.can_style = 0
  cut_model.can_style_text = "可能スタイル詳細#{no}}"
  cut_model.my_self = "自己紹介#{no}"
  cut_model.save!
end

(11..20).each do |no|
  user = User.create!(
    last_name: "性#{no}",
    first_name: "名#{no}",
    nick_name: "ニックネーム#{no}",
    user_type: 1,
    gender: "0",
    prefecture: "0",
    email: "#{no}@#{no}.jp",
    password: "$2a$10$R1lmG6HDxJiIk8eMNX2S2.uxgR0rejsMGVKlRa96yTDMcgVg4uLOe",
  )
  stylist = user.build_stylist
  stylist.target = 0
  stylist.base_price = 0
  stylist.want_long = 0
  stylist.want_style = 0
  stylist.want_style_text = "したい髪型#{no}"
  stylist.can_style = 0
  stylist.can_style_text = "できるスタイル#{no}"
  stylist.my_self = "自己紹介#{no}"
  stylist.salon_name = "美容室名#{no}"
  stylist.salon_url = "url:#{no}"
  stylist.salon_tel = "#{no}"
  stylist.salon_location = "住所#{no}"
  stylist.salon_area = 0
  stylist.salon_station = "最寄り駅#{no}"
  stylist.billing_location = "請求住所#{no}"
  stylist.save!
end

(21..30).each do |no|
  user = User.create!(
    last_name: "性#{no}",
    first_name: "名#{no}",
    nick_name: "ニックネーム#{no}",
    user_type: 2,
    gender: "0",
    prefecture: "0",
    email: "#{no}@#{no}.jp",
    password: "$2a$10$R1lmG6HDxJiIk8eMNX2S2.uxgR0rejsMGVKlRa96yTDMcgVg4uLOe",
  )
  salon = user.build_salon
  salon.salon_name = "美容室名#{no}"
  salon.salon_url = "url:#{no}"
  salon.salon_tel = "#{no}"
  salon.salon_location = "住所#{no}"
  salon.salon_area = 0
  salon.salon_station = "最寄り駅#{no}"
  salon.billing_location = "請求住所#{no}"
  salon.save!
end

