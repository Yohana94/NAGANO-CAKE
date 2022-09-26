class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id,                  null: false, default: ""
      t.integer :order_status,                 null: false, default: "0"
      t.integer :accounting_amount,            null: false, default: ""
      t.integer :postage,                      null: false, default: "800"
      t.integer :method_of_payment,            null: false, default: ""
      t.string :post_code,                     null: false, default: ""
      t.string :address,                       null: false, default: ""
      t.string :address_name,                  null: false, default: ""
    end
  end
end
