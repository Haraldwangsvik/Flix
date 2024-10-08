class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  has_secure_password

  validates :name, presence: true

  validates :email, presence: true,
                    format: { with: /\A\S+@\S+\z/ },
                    uniqueness: { case_sensitive: false }

end
