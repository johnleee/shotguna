class Activity < ActiveRecord::Base
  attr_accessible :activity_type_id, :date, :distance, :name, :time
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :distance, presence: true, length: { maximum: 3 }

  default_scope order: 'activities.created_at DESC'
end
