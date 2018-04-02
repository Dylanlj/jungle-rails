class User < ActiveRecord::Base
  has_secure_password
    validates :first_name,
    presence: true
    validates :last_name,
    presence: true
    validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }
    validates :password,
    presence: true,
    length: { minimum: 6 }
    validates :password_confirmation,
    presence: :true


  def self.authenticate_with_credentials(email, password)
    regex = /^\S*$/
    user = User.find_by_email(email.gsub(/\s+/, "").downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
