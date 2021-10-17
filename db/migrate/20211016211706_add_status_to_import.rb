class AddStatusToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :status, :integer, :default => 0
  end
end
