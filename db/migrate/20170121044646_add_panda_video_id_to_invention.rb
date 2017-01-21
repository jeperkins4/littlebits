class AddPandaVideoIdToInvention < ActiveRecord::Migration[5.0]
  def change
    add_column :inventions, :panda_video_id, :string
  end
end
