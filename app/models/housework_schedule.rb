class HouseworkSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :housework
  
  validates :description, length: {maximum:255}
  validates :started_at, presence: true
  validates :ended_at, presence: true
end
