# -*- encoding: utf-8 -*-
class Mypage::ChatController < ApplicationController
  require "cgi"

  layout 'basic'
  before_filter :check_user_type
  
  def index
    @page = params[:page] || 1
    @chats = Chat.of_user(@current_user).newest.page(@page).per(PER_PAGE_10)
  end

  def show
    @chat = Chat.where(id: params[:id]).first
    redirect_to mypage_chat_path if @chat.blank?
    @chat_message = ChatMessage.new
  end
  
  def create
    chat = Chat.where(id: params[:id]).first
    redirect_to mypage_chat_path(chat) if chat.blank? || ( params[:chat_message][:message].blank? && params[:chat_message][:image].blank?)
    ChatMessage.create!(
      chat_id: params[:id],
      user_type: @current_user.user_type.to_i,
      message: CGI.escapeHTML(params[:chat_message][:message]).gsub(/\r\n|\r|\n/, "<br />"),
      image: params[:chat_message][:image],
    )
    redirect_to mypage_chat_path(chat)
  end
end
