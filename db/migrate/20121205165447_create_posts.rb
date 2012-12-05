class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :date, null: false
      t.string :title, null: false, default: ''
      t.text :body, null: false, default: ''

      t.timestamps
    end

    add_index :posts, :date
  end
end
