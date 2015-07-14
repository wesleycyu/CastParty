class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :author_id, presence: true
end