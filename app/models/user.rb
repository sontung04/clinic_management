class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { username.downcase! }
  validates :username, presence: true, length: { minimum: 6, maximum: 50 }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  enum role: {
    admin: 0,
    doctor: 1,
    patient: 2
  }

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  has_one :doctor, dependent: :destroy
  has_one :patient, dependent: :destroy
  has_one :admin, dependent: :destroy

  def profile
    case role
    when "admin" then :admin
    when "doctor" then :doctor
    when "patient" then :patient
    end
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost) 
  end
end
