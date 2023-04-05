class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :restaurant
      t.text :foodCombo
      t.integer :rating
      t.timestamps
    end
  end
end
