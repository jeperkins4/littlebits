class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :invention, foreign_key: true
      t.string :name
      t.string :description
      t.string :panda_video_id
      t.integer :priority
      t.string :media

      t.timestamps
    end

    remove_column :inventions, :video
    remove_column :inventions, :panda_video_id
  end
end
