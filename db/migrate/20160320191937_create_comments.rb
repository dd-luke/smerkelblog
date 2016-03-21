class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, null: false, index: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      # Have the candidate add a compound index.
      t.index [:commentable_id, :commentable_type]
    end
  end
end
