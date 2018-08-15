class CreateRealEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :real_estates do |t|
      t.string :place, null: false
      t.integer :price, null: false
      t.string :year, null: false

      t.timestamps
    end
  end
end
