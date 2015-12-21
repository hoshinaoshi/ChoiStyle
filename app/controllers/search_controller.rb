# -*- encoding: utf-8 -*-
class SearchController < ApplicationController
  layout 'basic'
  before_filter :set_user_type

  def index
    @page = params[:page] || 1
    @params = params
    @params[:salon_prefecture] = @params[:salon_prefecture] || ""
    @params[:salon_area] = @params[:salon_area] || ""
    
    # 未登録の場合
    if @params["search_cut_model"].present? 
      @users = CutModel.includes(:user).active.order_sign_in
      kind = "cut_model"
    elsif @params["search_stylist"].present?
      @users =  Stylist.active.order_amout
      kind = "stylist"
    end
    
    if @users.blank?
      if @current_user.blank? || @current_user.cut_model? || @current_user.not_register? 
        @users =  Stylist.active.order_amout
        kind = "stylist"
      else
        @users = CutModel.includes(:user).active.order_sign_in
        kind = "cut_model"
      end
    end

    if @params[:salon_prefecture].present?
      @users = @users.of_prefecture(@params[:salon_prefecture])
    end

    if @params[:salon_area].present?
      @users = @users.of_area(@params[:salon_area])
    end

    @users = @users.search_want_long(params[:want_long].to_i) if params[:want_long].present? && params[:want_long] != "0" && WANT_LONG_HASH.key?(params[:want_long].to_i)
    @users = @users.search_want_style(params[:want_style].to_i) if params[:want_style].present? && params[:want_style] != "0" && WANT_STYLE_HASH.key?(params[:want_style].to_i)
    @users = @users.search_can_style(params[:can_style].to_i) if params[:can_style].present? && CAN_STYLE_HASH.key?(params[:can_style].to_i)
    @users = @users.page(@page).per(PER_PAGE)
    set_page_title(@params[:salon_prefecture], @params[:salon_area], kind)
  end

  def show
    if params["search_cut_model"].present? 
      @user = CutModel.active.of_cut_model(params[:id]).first
    elsif params["search_stylist"].present?
      @user =  Stylist.active.of_stylist(params[:id]).first
    end

    if @user.blank?
      if @current_user.blank? || @current_user.cut_model? || @current_user.not_register?
        @user =  Stylist.active.of_stylist(params[:id]).first
      else
        @user = CutModel.active.of_cut_model(params[:id]).first
      end
    end
    redirect_to search_index_path and return if @user.blank?

    # タイトル h1設定
    if @user.user.present? && @user.user.cut_model?
      prefecture = @user.user.prefecture
      area = @user.user.prefecture
      kind = "cut_model"
      salon_name = ""
    else
      prefecture = self.class.helpers.salon_prefecture(@user)
      area = self.class.helpers.salon_area(@user)
      kind = "stylist"
      salon_name = self.class.helpers.salon_name(@user)
    end
    set_page_title_show(prefecture,area,kind,salon_name)
  end

private

  def set_user_type
    redirect_to users_select_type_path and return if @current_user.present? && @current_user.user_type.blank?
  end

  def set_page_title(prefecture,area,kind)
    kind_name = (kind == "cut_model" ? "カットモデル" : "スタイリスト")
    if prefecture.blank?
      @h1 = kind_name + "を検索中"
      @page_title = kind_name + " " + "募集 | " + kind_name + "募集サイトならChoiStyle"
      return
    end
    if area.blank?
      @h1 = PREFECTURE_HASH[prefecture.to_i] + "の" +kind_name + "を検索中"
      @page_title = @h1 + " "  + kind_name + " " + "募集 | " + kind_name + "募集サイトならChoiStyle"
      return
    end
    prefecture = prefecture.to_i
    area = area.to_i
    @h1 = SALON_AREA_HASH[prefecture][area] + "の#{kind_name}ならChoiStyle"
    @page_title = PREFECTURE_HASH[prefecture] + " " + SALON_AREA_HASH[prefecture][area] + " " + kind_name + " | " + @h1
  end
  
  def set_page_title_show(prefecture,area,kind,salon_name="")
    @h1 =  (SALON_AREA_HASH[prefecture][area] || "東京") + (kind == "cut_model" ? "のカットモデルならChoiStyle" : "の美容室なら#{salon_name.present? ? salon_name : "ChoiStyle"}")
    @page_title = (SALON_AREA_HASH[prefecture][area] || "東京 ") +
                  (kind == "cut_model" ? "カットモデル" : "美容室 カットモデル") +
                  " | " +
                  @h1
  end
end
