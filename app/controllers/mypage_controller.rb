# -*- encoding: utf-8 -*-
class MypageController < ApplicationController
  layout 'basic'
  before_filter :check_user_type
end
