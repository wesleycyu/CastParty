class LikeTableRename < ActiveRecord::Migration
  def change
    rename_table :likes, :upvotes
  end
end
