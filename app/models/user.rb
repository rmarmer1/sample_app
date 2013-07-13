# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

attr_accessible :name, :email, :password, :password_confirmation  

  validates :name, presence: true, length: {maximum: 50}
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                  
  before_save { |user| user.email = email.downcase }
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
    
  # This "callback" passes a block to the before_save callback and sets the user’s email 
  # address to a lower-case version of its current value using the downcase string method. 
end
