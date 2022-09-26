class CreateAddresesses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresesses do |t|

      t.timestamps
      t.integer :customer_id,                  null: false, default: ""
      t.string :name,                          null: false, default: ""
      t.string :postal_code,                  null: false, default: ""
      t.string :address,                      null: false, default: ""
    end
  end
end
