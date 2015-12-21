# -*- encoding: utf-8 -*-
class Admin::UserController < AdminBaseController
  def index
    @page = params[:page] || 1
    @users = User.where("id IS NOT NULL").newest.page(@page).per(PER_PAGE)
  end
end
