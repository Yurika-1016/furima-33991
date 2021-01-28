class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :content, null:false
      t.integer :category_id, null:false
      t.integer :item_status_id, null:false
      t.integer :delivery_fee_id, null:false
      t.integer :shipping_area_id, null:false
      t.integer :shipping_days_id, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreigin_keys: true
      t.timestamps
    end
  end
end
