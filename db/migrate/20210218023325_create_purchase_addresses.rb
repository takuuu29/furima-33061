class CreatePurchaseAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_addresses do |t|

      t.timestamps
    end
  end
end
