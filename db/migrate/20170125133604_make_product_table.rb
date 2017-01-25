class MakeProductTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :electronics, :products
  end
end
