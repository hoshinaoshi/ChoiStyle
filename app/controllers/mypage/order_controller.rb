# -*- encoding: utf-8 -*-
class Mypage::OrderController < ApplicationController
  layout 'basic'
  before_filter :check_user_type
  before_filter :stylist_or_salon_only
  
  def index
    now_time = Time.now
    begin_month = now_time.beginning_of_month.strftime("%Y%m%d").to_i
    end_month = now_time.end_of_month.strftime("%Y%m%d").to_i
    if @current_user.salon?
      @billing_amount = OrderHistory.of_salon(@current_user.salon.id).where("salon_id IS NOT NULL").where(order_date: begin_month..end_month).group("salon_id").sum("order_amount").first
    else
      @billing_amount = OrderHistory.of_stylist(@current_user.stylist.id).where("salon_id IS NULL").where(order_date: begin_month..end_month).group("salon_id").sum("order_amount").first
    end

    @orders = Stylist.exists_order_amout.active.order_amout.limit(PER_PAGE)
    if @current_user.salon?
      @stylists = Stylist.of_salon(@current_user.salon.id)
    else
      @stylists = Stylist.of_stylist(@current_user.stylist.id)
    end
  end
  
  def edit
    if @current_user.salon?
      user = @current_user.salon
    else
      user = @current_user.stylist
    end
    @billing = user.billing_location.blank? ? user.salon_location : user.billing_location
    @zip = user.billing_zip.blank? ? user.salon_zip : user.billing_zip
  end

  def billing_update
    if @current_user.salon?
      @current_user.salon.update_attributes!(billing_zip: params[:billing_zip], billing_location: params[:billing_location])
    else
      @current_user.stylist.update_attributes!(billing_zip: params[:billing_zip], billing_location: params[:billing_location])
    end
    redirect_to mypage_order_index_path, :notice => "請求書情報を更新しました。"
  end

  def update
    if @current_user.salon?
      @stylist = Stylist.of_salon(@current_user.salon.id).of_stylist(params[:id]).first
    else
      redirect_to search_index_path and return unless params[:id].to_i == @current_user.stylist.id
      @stylist = Stylist.of_stylist(@current_user.stylist.id).first
    end

    order_amount = params[:order_amount].to_i
    @stylist.update_attributes!(order_amount: order_amount, order_update_flag: true)
    render :nothing => true
  end

  private

  def stylist_or_salon_only
    redirect_to searchindex_path and return if @current_user.blank? || @current_user.cut_model?
  end
end
