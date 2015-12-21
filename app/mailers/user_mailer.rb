# -*- encoding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: "ChoiStyle<admin@choistyle.net>"

  def create_offer(user,offer)
    @current_user = user
    @offer = offer
    if offer.cut_model?
      @receive_user = offer.salon_id.present? ? offer.salon.user : offer.stylist.user
    else
      @receive_user = offer.cut_model.user
    end
    mail(
      :to => @receive_user.email,
      :subject => "【ChoiStyle】オファーが届いています",
    )
  end

  def ok_offer(user,offer,chat)
    @current_user = user
    @offer = offer
    @chat = chat
    if offer.cut_model?
      @receive_user = offer.cut_model.user
    else
      @receive_user = offer.salon_id.present? ? offer.salon.user : offer.stylist.user
    end
    mail(
      :to => @receive_user.email,
      :subject => "【ChoiStyle】オファーが承諾されました。"
    )
  end

  def ng_offer(user,offer)
    @current_user = user
    @offer = offer
    if offer.cut_model?
      @receive_user = offer.cut_model.user
    else
      @receive_user = offer.salon_id.present? ? offer.salon.user : offer.stylist.user
    end
    mail(
      :to => @receive_user.email,
      :subject => "【ChoiStyle】オファーが承諾されませんでした。",
    )
  end

  def error_mail(exception,user,url)
    @exception = exception
    @user = user
    @url = url
    mail(
      :to => "admin@choistyle.net",
      :subject => "【ChoiStyle】エラーが発生しました。",
    )
  end

  def send_mail(row)
    @salon_name = row[0]
    mail(
      :to => row[1],
      :subject => "【ChoiStyle】カットモデル募集サイトを公開しました。是非ご利用ください。",
    )
  end
end
