class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.references :invention, foreign_key: true
      t.string :media

      t.timestamps
    end
  end
end
