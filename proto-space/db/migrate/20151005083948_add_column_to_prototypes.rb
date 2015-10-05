class AddColumnToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :likes_count, :integer, default: 0, null: :false
  end
end
