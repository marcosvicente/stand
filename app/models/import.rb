class Import < ApplicationRecord
  mount_uploader :file, ImportUploader

  enum status: [:enqueued, :processing, :done]

  # paginator 
  paginates_per 50

end
