class CreateRecordNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :record_numbers do |t|
      t.integer :count, null: false
      t.string :date, null: false
      t.string :company, null: false

      t.timestamps
    end
  end
end
