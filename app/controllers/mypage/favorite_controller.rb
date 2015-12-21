# -*- encoding: utf-8 -*-
class Mypage::FavoriteController < ApplicationController
  layout 'basic'
  before_filter :check_user_type
  
  def index
    @page = params[:page] || 1
    @favorites = Favorite.of_user(@current_user).newest.page(@page).per(PER_PAGE)
  end

  def create
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

    unless Favorite.exists?(
      user_id: @current_user.id,
      salon_id: salon_id,
      stylist_id: stylist_id,
      cut_model_id: cut_model_id
    )
      Favorite.create!(
        user_id: @current_user.id,
        salon_id: salon_id,
        stylist_id: stylist_id,
        cut_model_id: cut_model_id,
      )
    end
    redirect_to(mypage_favorite_index_path, :notice => "お気に入りを追加しました。")
  end
end
