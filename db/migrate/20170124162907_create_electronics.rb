class CreateElectronics < ActiveRecord::Migration[5.0]
  def change
    create_table :electronics do |t|
      t.string :name
      t.string :item_type
      t.string :make
      t.string :description
      t.string :image
      t.integer :price
      t.integer :shipping_period

      t.timestamps
    end
  end
end
