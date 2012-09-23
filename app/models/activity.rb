class Activity < ActiveRecord::Base
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  attr_accessible :activity_type_id, :date, :distance, :name, :time, :address_attributes
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :distance, presence: true, length: { maximum: 3 }
  validates :time, presence: true, length: { maximum: 3 }

  default_scope order: 'activities.created_at DESC'

  def pace
    time.to_f / distance.to_f
  end
end
