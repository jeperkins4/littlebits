class AddUserToInvention < ActiveRecord::Migration[5.0]
  def change
    add_reference :inventions, :user, foreign_key: true
  end
end
