class Event < ApplicationRecord

  validates :name ,uniqueness: true, presence: true
  validates :date ,uniqueness: true, presence: true
end
