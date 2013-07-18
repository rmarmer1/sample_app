# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation 
  # :remember_token is not added here, but using 'self.remember_token = ... '
  # makes the attribute writable from within the 'private' method below...
  
  has_secure_password

  before_save { |user| user.email = email.downcase }
  
  # callback method to create the remember token:
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  after_validation { self.errors.messages.delete(:password_digest) }
      
  # This "callback" passes a block to the before_save callback and sets the user’s email 
  # address to a lower-case version of its current value using the downcase string method. 

  private
  # Create the token. Using self ensures that assignment sets the user’s remember_token.
    def create_remember_token
      
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
