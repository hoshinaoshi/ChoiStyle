# -*- encoding: utf-8 -*-
class TopController < ApplicationController
  layout 'basic'
  def index
    @user_count = User.count
    return if @current_user.blank?
    redirect_to users_select_type_path and return if @current_user.user_type.blank?
    redirect_to search_index_path
  end

  def info
  end
  
  def privacy_policy
  end
  
  def terms
  end
  
  def law
  end
  
  def faq
  end
  
end
