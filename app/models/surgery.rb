class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number

  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def least
    doctors.order(:years_practiced).limit(1).first
  end

  def most
    doctors.order(years_practiced: :desc).limit(1).first
  end

  def self.ordered_average_practiced
    # joins with doctors
    # group by surgery id
    #select.* from surgeries, AVG(years_practiced) AS average
    # order(average: :desc)
     # Surgery.joins(:doctors).select(surgeries, AVG(years_practiced) AS average)
     # group(surgerys.id)
    require "pry"; binding.pry

  end
end


# SELECT SUM(invoice_items.quantity * (invoice_items.unit_price * 0.9)) AS total_discount, items.id AS items_id, SUM(invoice_items.quantity) AS item_count
# FROM discounts
# JOIN merchants
# ON discounts.merchant_id = merchants.id
# JOIN items
# ON items.merchant_id = merchants.id
# JOIN invoice_items
# ON invoice_items.item_id = items.id
# WHERE merchants.id = 1 AND invoice_items.invoice_id = 29 AND invoice_items.quantity >= discounts.quantity
# GROUP BY items.id
# ORDER BY total_discount;

#SELECT avg(doctors.years_practiced) AS average, surgeries.*
#FROM surgerys
#JOINS doctors
#ON surgerys.id = doctors. 
