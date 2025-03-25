class ChangeItems < ActiveRecord::Migration[8.0]
  def change
      change_column :items, :rating, :decimal, precision: 3, scale: 1
      change_column_default :items, :rating, from: nil, to: 0
  end
end
