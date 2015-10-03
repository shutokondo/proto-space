class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string :name
      t.references :prototype
      t.integer :property

      t.timestamps null: false
    end
  end
end
