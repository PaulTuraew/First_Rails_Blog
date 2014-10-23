class SetDefaultDraftOnPosts < ActiveRecord::Migration
  def up
    Post.all.each do |post|
      post.draft = false
      post.save!
    end

    change_column :posts, :draft, :boolean, default: true, null: false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
