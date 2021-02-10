class CreateScheduleds < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduleds do |t|

      t.timestamps
    end
  end
end
