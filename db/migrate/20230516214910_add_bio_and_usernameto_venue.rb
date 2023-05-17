class AddBioAndUsernametoVenue < ActiveRecord::Migration[7.0]
  def change
      add_column :venues, :bio, :text
      add_column :venues, :private, :boolean, default: true
      add_column :venues, :username, :string
  end
end
