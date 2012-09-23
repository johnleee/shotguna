class Address < ActiveRecord::Base
  attr_accessible :city, :line1, :line2, :name, :state, :zip

  belongs_to :addressable, :polymorphic => true

  validates :city, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :zip, presence: true, length: { maximum: 10 }

end
