class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :event
      t.date :entry_date
      t.string :location
      t.decimal :total_amount

      t.timestamps null: false
    end
  end
end
