class User < ApplicationRecord

  def self.authenticate_with_credentials(email, password)
    # Check email is associated with email
    trim_email = email&.strip&.downcase
    user = User.find_by_email(trim_email)

    if (!user)
      return nil
    end

    # Check if user password matches
    if (!user.authenticate(password))
      return nil
    end

    return user
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true
end
