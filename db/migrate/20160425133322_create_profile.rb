class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.references :user, null: false, index: true
    end
  end
end
