class User < ApplicationRecord
  has_one_attached :image
  before_save {self.email = email.downcase}
  has_many :posts
  validates :username, presence: true, length: {minimum: 3, maximum: 20}, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 5, maximum: 25}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX }
end
