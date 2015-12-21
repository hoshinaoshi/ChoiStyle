#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
class SendMail
  require "csv"
  def self.do
    CSV.foreach("/home/ec2-user/send_mail.csv", "r") do |row|
      UserMailer.send_mail(row).deliver
      sleep(1)
    end
  end
end
