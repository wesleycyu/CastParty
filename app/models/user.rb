class User < ActiveRecord::Base
  has_many :songs
  validates :email, presence: true, uniqueness: true
end