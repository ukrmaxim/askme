require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')
  USERNAME_REGEXP = /\A\w+\z/
  USEREMAIL_REGEXP = /\A[\w.]+@[a-zа-я\d]+\.[a-zа-я]+\z/
  PROFILEBG_REGEXP = /\A#\h{6}\z/
  AVATARURL_REGEXP = %r{\A(http|https|www)+://[a-z\-а-я\d]+\.[a-zа-я]+/+}

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :email, presence: true, uniqueness: true, format: { with: USEREMAIL_REGEXP }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :background, format: { with: PROFILEBG_REGEXP }
  validates :avatar_url, allow_blank: true, format: { with: AVATARURL_REGEXP }

  before_validation :normalize_letters
  before_save :encrypt_password

  def self.hash_to_string(password_hash)
    password_hash.unpack1('H*')
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def normalize_letters
    email&.downcase!
    username&.downcase!
  end
end
