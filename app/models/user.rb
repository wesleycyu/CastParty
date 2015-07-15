class User < ActiveRecord::Base
  has_many :songs
  has_many :upvotes

  validates :email, presence: true, uniqueness: true
  validates :name , presence: true, uniqueness: true
  validates :password, presence: true
end