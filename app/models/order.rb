
class Order < ApplicationRecord

  belongs_to :user, optional: true, class_name: 'User', foreign_key: 'user_id'
  validates :amount, presence: true
  validates :order_name, presence: true, length: { maximum: 50 }

  FREQUENCYTYPES = [ ["Daily", "daily"], ["Weekly", "weekly"], ["Monthly", 'monthly'] ]

end

