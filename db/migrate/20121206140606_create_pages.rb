class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug, null: false
      t.string :title, null: false, default: ''
      t.text :body, null: false, default: ''
      t.string :ancestry
      t.integer :order, null: false
      t.string :meta_description, null: false, default: ''

      t.timestamps
    end
    add_index :pages, :slug
    add_index :pages, :ancestry
    add_index :pages, :order
  end
end
