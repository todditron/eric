# This migration comes from eric_engine (originally 20121205161832)
class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name, null: false
      t.string :title, null: false, default: ''
      t.text :body, null: false, default: ''

      t.timestamps
    end

    add_index :blocks, :name, unique: true
  end
end
