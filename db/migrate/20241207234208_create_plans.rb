class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :price
      t.integer :ocurrency
      t.text :about

      t.timestamps
    end
  end
end
