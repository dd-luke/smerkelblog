class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :theme
      t.references :user, null: false, index: true
    end
  end
end
