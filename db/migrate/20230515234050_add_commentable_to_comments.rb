class AddCommentableToComments < ActiveRecord::Migration[7.0]
  def change
    def change
    add_reference :comments, :commenter, polymorphic: true, index: true
  end
  end
end
