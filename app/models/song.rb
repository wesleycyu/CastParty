class Song < ActiveRecord::Base
  belongs_to :author

  validates :title, presence: true
  validates :author_id, presence: true
end