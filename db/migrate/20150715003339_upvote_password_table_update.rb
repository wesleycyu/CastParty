class UpvotePasswordTableUpdate < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :song
    end
    add_column :users, :password, :string
  end
end
