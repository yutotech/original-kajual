class Housework < ApplicationRecord
  belongs_to :user
  has_many :housework_schedules, dependent: :destroy
  
  validates :category, presence: true, length: {maximum: 50}
  validates :name, presence: true, length: {maximum: 50}
  validates :goal, presence: true
  validates :frequency, presence: true, length: {maximum: 255}
end
