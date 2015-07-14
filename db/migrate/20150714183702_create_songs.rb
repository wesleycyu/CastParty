class CreateSongs < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :bio
      t.timestamps
    end

    create_table :songs do |t|
      t.references :author
      t.string :title
      t.string :artist
      t.string :url
      t.timestamps
    end
  end
end
