class AddVideoToInvention < ActiveRecord::Migration[5.0]
  def change
    add_column :inventions, :video, :string
  end
end
