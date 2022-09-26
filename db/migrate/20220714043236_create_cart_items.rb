class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps
      t.integer :item_id,                  null: false, default: ""
      t.integer :customer_id,              null: false, default: ""
      t.integer :amount,                   null: false, default: ""
    end
  end
end
