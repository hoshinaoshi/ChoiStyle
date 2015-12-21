# -*- encoding: utf-8 -*-
#class UsersController < ActionController::Base
class UsersController < ApplicationController
  layout 'basic'

  def destroy
    cookies.delete(:id)
    session[:id] = nil
    redirect_to root_path
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth.provider,u_id: auth.uid).first
    if user.blank?
      user = User.create!(
        provider: auth.provider,
        u_id: auth.uid,
        u_name: auth.info.name,
        token: auth.credentials.token,
        secret_token: auth.credentials.secret,
        last_sign_in_at: Time.now
      )
    end
    cookies[:id] = user.id
    session[:id] = user.id

    redirect_to users_change_path
  end

  def change
    redirect_to root_path if @current_user.blank?
  end
  
  def update
    @current_user.cut_model.update_attributes!(user_params[:cut_model_attributes]) if @current_user.cut_model?
    @current_user.stylist.update_attributes!(user_params[:stylist_attributes]) if @current_user.stylist?
    @current_user.salon.update_attributes!(user_params[:salon_attributes]) if @current_user.salon?
    @current_user.update_attributes!(user_params) if @current_user.not_register?
    @current_user.save!

    # 初期登録
    if params[:user].key?("user_type")
      case params[:user][:user_type].to_i
        when USER_TYPE_MODEL
          @current_user.build_cut_model
        when USER_TYPE_STYLIST
          @current_user.build_stylist
        when USER_TYPE_SALON
          @current_user.build_salon
      end
      @current_user.save!
      redirect_to( search_index_path ) and return
    end
    redirect_to({:action => "change"},:notice => "ユーザ情報を更新しました") and return
  end

private

  def user_params
    if @current_user.not_register?
      params.require(:user).permit(:name, :nick_name, :user_type, :gender)
    elsif @current_user.cut_model?
      params[:user][:cut_model_attributes].delete(:cut_model_image_attributes) if (params[:user][:cut_model_attributes].key?(:cut_model_image_attributes) && params[:user][:cut_model_attributes][:cut_model_image_attributes][:_destroy] == "0") && !params[:user][:cut_model_attributes][:cut_model_image_attributes].key?("image")
      params.require(:user).permit(:cut_model_attributes => [:prefecture,:area,:hair_long,:hair_type,:volume,:wavy,:when_parm,:when_color,:want_style,:want_long,:want_style,:want_style_text,:can_style,:can_style_text,:my_self, :cut_model_image_attributes=> [:id,:image,:_destroy]])
    elsif @current_user.stylist?
      params[:user][:stylist_attributes].delete(:stylist_image_attributes) if (params[:user][:stylist_attributes].key?(:stylist_image_attributes) && params[:user][:stylist_attributes][:stylist_image_attributes][:_destroy] == "0") && !params[:user][:stylist_attributes][:stylist_image_attributes].key?("image")
      params.require(:user).permit(:stylist_attributes => [:salon_prefecture,:target,:want_long,:want_style,:want_style_text,:can_style,:base_price,:can_style_text,:my_self,:salon_name,:salon_url,:salon_tel,:salon_area,:salon_station,:salon_location,:salon_zip, :stylist_image_attributes=> [:id,:image,:_destroy]])
    elsif @current_user.salon?
      params[:user][:salon_attributes].delete(:salon_images_attributes) if params[:user][:salon_attributes][:salon_images_attributes].blank? && (params[:user][:salon_attributes][:salon_images_attributes].blank? || params[:user][:salon_attributes][:salon_images_attributes].keys.length == 0)
      params.require(:user).permit(:salon_attributes => [:salon_prefecture,:salon_name,:salon_url,:salon_tel,:salon_location,:salon_zip,:salon_area,:salon_station, :salon_images_attributes=> [:id,:image,:_destroy]])
    end
  end
end
