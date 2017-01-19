class CreateInventions < ActiveRecord::Migration[5.0]
  def change
    create_table :inventions do |t|
      t.string :title
      t.text :description
      t.string :user_name
      t.string :email
      t.text :bits
      t.text :materials

      t.timestamps
    end
  end
end
