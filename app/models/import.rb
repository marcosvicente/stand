class Import < ApplicationRecord
  mount_uploader :file, ImportUploader

  enum status: [:enqueued, :processing, :done]

  # paginator 
  paginates_per 50

  # enum
  def human_status
    Import.human_enum_name(:status, self.status) if self.status
  end
end
