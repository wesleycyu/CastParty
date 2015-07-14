class Author < ActiveRecord::Base
  has_many :songs

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end