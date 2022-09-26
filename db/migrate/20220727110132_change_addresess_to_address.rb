class ChangeAddresessToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_table :addresesses, :addresses
  end
end
