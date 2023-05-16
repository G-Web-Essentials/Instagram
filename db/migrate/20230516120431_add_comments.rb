class AddComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :commentable, null: :false, polymorphic: true
      t.references :commenter, null: :false, polymorphic: true
      t.text :body

      t.timestamps
    end
  end
end
