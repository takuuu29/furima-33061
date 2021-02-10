class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name
      t.text :text,            null: false
      t.string :category_id,   null: false
      t.string :sales_id,      null: false
      t.string :shipping_id,   null: false
      t.string :prefecture_id, null: false
      t.string :scheduled_id,  null: false
      t.integer :price,        null: false
      t.references :user,      foreign_key: true
      
      t.timestamps
    end
  end
end
