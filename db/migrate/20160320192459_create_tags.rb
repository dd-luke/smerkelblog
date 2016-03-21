class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :color, default: '#0000FF'
    end
  end
end
