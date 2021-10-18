class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :time
      t.datetime :hour

      t.timestamps
    end
  end
end
