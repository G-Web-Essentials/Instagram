class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: true, foreign_key: true
      t.references :venue, null: true, foreign_key: true
      t.references :post, null: true, foreign_key: true
      t.references :animal, null: true, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
