class Event < ApplicationRecord
  mount_uploaders :file, ImportFileUploader

  validates :name ,uniqueness: true, presence: true
  validates :date ,uniqueness: true, presence: true
end
