class AdminBaseController < ApplicationController
  before_filter :check_admin_user
  layout 'admin'

  private

  def check_admin_user
    redirect_to root_path if @current_user.blank?
  end
end
