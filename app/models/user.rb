class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, length: { minimum: 3 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true

  def authenticate_with_credentials(email, password)
    email_trim = email.strip
    User.find_by(email: email_trim)&.authenticate(password)
  end
end
