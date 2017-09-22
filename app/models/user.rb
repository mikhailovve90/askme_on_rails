require 'openssl'
require 'validates_email_format_of'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, email_format: true
  # without gem 'validates_email_format_of: validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :username, length: { maximum: 40 }
  validates :username, format: { with: /\A[a-zA-Z0-9\_]+\Z/ }
  validates :color , format: { with: /\A[a-fA-f0-9#]+\Z/ }
  validates :color , length: { maximum: 8 }

  attr_accessor :password # :avatar_url, :color
  #attr_writer :avatar_url, :color
  #attr_reader :avatar_url, :color

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password
  before_validation :downcase_username

  def encrypt_password
    if self.password.present?

      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email) # поиск по емайлу

    if user.present? &&
        user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  def downcase_username
    self.username = self.username.downcase
  end
end
