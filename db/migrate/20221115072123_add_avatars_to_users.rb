class AddAvatarsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :avatar, :string
  end
end
