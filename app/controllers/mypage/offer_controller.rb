# -*- encoding: utf-8 -*-
class Mypage::OfferController < ApplicationController
  require "cgi"
  
  layout 'basic'
  before_filter :check_user_type
  
  def index
    @page = params[:page] || 1
    @sends = Offer.of_user(@current_user).sender(@current_user.user_type).newest.page(@page).per(PER_PAGE_10)
    @receives = Offer.of_user(@current_user).receive(@current_user.user_type).newest.page(@page).per(PER_PAGE_10)
  end
  
  def show
    @offer = Offer.where(id: params[:id]).first
  end

  def new
    if @current_user.cut_model?
      @send_user = Stylist.active.where(id: params[:send_user_id]).first
      salon_id     = @send_user.salon_id
      stylist_id   = params[:send_user_id]
      cut_model_id = @current_user.cut_model.id
    elsif @current_user.stylist?
      @send_user = CutModel.active.where(id: params[:send_user_id]).first
      salon_id     = ""
      stylist_id   = @current_user.stylist.id
      cut_model_id = params[:send_user_id]
    elsif @current_user.salon?
      @send_user = CutModel.active.where(id: params[:send_user_id]).first
      salon_id     = @current_user.salon.id
      stylist_id   = ""
      cut_model_id = params[:send_user_id]
    end

    redirect_to search_path, :notice => "指定したスタイリストは存在しません。" if @send_user.blank?
    @offer = Offer.new(salon_id: salon_id, stylist_id: stylist_id, cut_model_id: cut_model_id, offer_type: @current_user.user_type)
  end

  def create
    offer = Offer.create!(offer_params)
    offer.receive_user.send_twitter("カットモデルのオファーが来ました。http://choistyle.net #カットモデル #スタイリスト #美容室")
    redirect_to mypage_offer_index_path, :notice => "オファーを送信しました"
  end

  def complete
  end

  def fix
    offer = Offer.where(id: params[:offer_id]).first
    redirect_to mypage_path, :notice => "指定したオファーは存在しません。" if offer.blank?
    offer.update_attributes!(status: params[:approve_flag])
    if offer.ok?
      chat = Chat.create!(
        offer_id: offer.id,
        salon_id: offer.salon_id,
        stylist_id: offer.stylist_id,
        cut_model_id: offer.cut_model_id
      )
      offer.sender_user.send_twitter("カットモデルのオファーが承認されました。http://choistyle.net #カットモデル #スタイリスト #美容室")
      redirect_to mypage_chat_path(chat)
    else
      redirect_to mypage_offer_index_path, :notice => "オファーを却下しました。"
    end
  end

private

  def offer_params
    params.require(:offer).permit(:salon_id,:stylist_id,:cut_model_id,:status,:subject,:content,:offer_type)
  end
end
