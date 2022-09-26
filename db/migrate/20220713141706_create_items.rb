class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id,                  null: false, default: ""
      t.string :name,                          null: false, default: ""
      t.text :introduction,                  null: false, default: ""
      t.string :price,                      null: false, default: ""
    end
  end
end
