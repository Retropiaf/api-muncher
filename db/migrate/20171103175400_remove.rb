class Remove < ActiveRecord::Migration[5.1]
  def change
    drop_table :favorite
  end
end
