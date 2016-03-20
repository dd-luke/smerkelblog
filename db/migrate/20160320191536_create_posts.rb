class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      # Don't add the index, have the candidate associate each post with the blog's user and then add the index back.
      t.references :user, null: false, index: true
      t.references :blog, null: false, index: true
      t.index [:title, :blog_id], unique: true
    end

  end
end
