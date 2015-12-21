#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
class CreateOrderHistory
  def self.do
    @update_stylists = Stylist.where("order_update_flag = true OR order_amount > 0")
    time_now = 1.days.ago(Time.now).strftime("%Y%m%d").to_i
    @update_stylists.each do |stylist|
      ActiveRecord::Base.transaction do
        OrderHistory.create!(
          order_date: time_now,
          salon_id: stylist.salon_id,
          stylist_id: stylist.id,
          order_amount: stylist.order_amount
        )
        stylist.update_attributes!(order_update_flag: false)
      end
    end
  end
end
