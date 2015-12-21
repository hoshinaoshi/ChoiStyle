# -*- encoding: utf-8 -*-
class OpinionController < ActionController::Base
  require "cgi"
  def create
    Opinion.create!(user_id: params[:user_id],opinion_content: CGI.escapeHTML(params[:opinion_content]).gsub(/\r\n|\r|\n/, "<br />"))
    render :nothing => true
  end
end
