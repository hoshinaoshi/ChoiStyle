class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user
  before_filter :initialize_notice
  before_filter :set_title
  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from Exception, :with => :render_500
  
  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end
    render :file => "#{Rails.root}/public/404.html", :status => 404, :content_type => 'text/html', :layout => 'basic'
  end
  
  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
      UserMailer.error_mail(exception,@current_user,request.url).deliver
    end
    render :file => "#{Rails.root}/public/500.html", :status => 500, :content_type => 'text/html', :layout => 'basic'
  end

private

  def set_user
    if (cookies[:id].present? || session[:id].present?) && (User.exists?(id: cookies[:id]) || User.exists?(session[:id]))
      @current_user = (cookies[:id].present? ? User.find(cookies[:id]) : User.find(session[:id]))
      @current_user.update_attributes(last_sign_in_at: Time.now)
    end
  end

  def check_user_type
    redirect_to root_path and return if @current_user.blank?
    redirect_to users_select_type_path and return if @current_user.user_type.blank?
  end

  def initialize_notice
    flash[:notice] = "" if ["Signed in successfully.", "Your account was successfully confirmed. You are now signed in."].include?(flash[:notice])
  end

  def set_title
    @page_title = "カットモデル 募集 | カットモデルの募集サイトはChoiStyle"
  end
end
