class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :petname
      t.string :ppname
      t.integer :species, default: 0
      t.string :food
      t.string :notes
      t.date :vaccineapplied
      t.date :nextvaccine
      t.references :user, null: true, foreign_key: true
      t.references :venue, null: true, foreign_key: true

      t.timestamps
    end
  end
end
