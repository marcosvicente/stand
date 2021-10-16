class AddTotalRowAndCurrentRowToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :total_row, :integer
    add_column :imports, :current_row, :integer
  end
end
