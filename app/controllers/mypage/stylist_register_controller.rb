# -*- encoding: utf-8 -*-
class Mypage::StylistRegisterController < ApplicationController
  require "cgi"
  
  layout 'basic'
  before_filter :only_salon
  
  def index
    @page = params[:page] || 1
    @stylists = Stylist.of_salon(@current_user.salon.id).active.page(@page).per(PER_PAGE_10)
  end
  
  def new
    @stylist = Stylist.new(
                 salon_id: @current_user.salon.id,
                 salon_area: @current_user.salon.salon_area,
                 salon_prefecture: @current_user.salon.salon_prefecture
               )
  end

  def create
    @current_user.salon.stylists.build(stylist_params).save!
    redirect_to mypage_stylist_register_index_path, :notice => "スタイリストを登録しました"
  end

  def edit
    @stylist = Stylist.of_salon(@current_user.salon.id).of_stylist(params[:id]).active.first
    @editable = true
    redirect_to mypage_stylist_register_index_path, :alert => "存在しないスタイリストです" if @stylist.blank?
  end

  def update
    stylist = Stylist.of_salon(@current_user.salon.id).of_stylist(params[:id]).active.first
    redirect_to mypage_stylist_register_index_path, :alert => "存在しないスタイリストです" and return if stylist.blank?
    stylist.update_attributes!(stylist_params)
    redirect_to mypage_stylist_register_index_path, :notice => "スタイリストを情報を更新しました"
  end

  def destroy
    stylist = Stylist.of_salon(@current_user.salon.id).of_stylist(params[:id]).active.first
    redirect_to mypage_stylist_register_index_path, :alert => "存在しないスタイリストです" and return if stylist.blank?
    stylist.logical_destory
    redirect_to mypage_stylist_register_index_path, :notice => "スタイリストを削除しました"
  end

private

  def stylist_params
    params[:stylist].delete(:stylist_image_attributes) if (params[:stylist].key?(:stylist_image_attributes) && params[:stylist][:stylist_image_attributes][:_destroy] == "0") && !params[:stylist][:stylist_image_attributes].key?("image")
    params.require(:stylist).permit(:salon_prefecture,:salon_area,:gender,:name,:nick_name,:target,:want_long,:want_style,:want_style_text,:can_style,:can_style_text,:my_self, :base_price, :stylist_image_attributes=> [:image,:_destroy,:id])
  end

  def only_salon
    redirect_to search_index_path and return unless @current_user.salon?
  end
end
