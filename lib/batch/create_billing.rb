#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
class CreateBilling
  def self.do
    now_time = Time.now
    begin_month = 1.months.ago(now_time).beginning_of_month.strftime("%Y%m%d").to_i
    end_month = 1.months.ago(now_time).end_of_month.strftime("%Y%m%d").to_i
    create_stylist = OrderHistory.where(order_date: begin_month..end_month)
    salon_billings = create_stylist.select("sum(order_amount) as total_amount,salon_id").where("salon_id IS NOT NULL").group("salon_id")
    stylist_billings = create_stylist.select("sum(order_amount) as total_amount,stylist_id").where("salon_id IS NULL").group("stylist_id")
    
    # サロンごとの請求書
    salon_billings.each do |salon|
      BillingHistory.create!(
        month: now_time.strftime("%Y%m"),
        salon_id: salon.salon_id,
        total_amount: salon.total_amount
      )
    end

    # スタイリストごとの請求書
    stylist_billings.each do |stylist|
      BillingHistory.create!(
        month: now_time.strftime("%Y%m"),
        stylist_id: stylist.stylist_id,
        total_amount: stylist.total_amount
      )
    end
  end
end
