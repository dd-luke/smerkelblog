class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, index: :true
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
      t.index [:taggable_id, :taggable_type]
      # Have the candidate add this index (ask them to enforce uniqueness on the combination of tag and taggable).
      t.index [:tag_id, :taggable_id, :taggable_type], unique: true
    end
  end
end
