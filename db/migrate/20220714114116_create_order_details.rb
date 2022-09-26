class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :order_id,                  null: false, default: ""
      t.integer :item_id,                   null: false, default: ""
      t.integer :making_status,             null: false, default: "0"
      t.integer :amount,                    null: false, default: ""
      t.integer :price,                     null: false, default: ""

    end
  end
end
