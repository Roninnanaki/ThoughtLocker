# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_many :blogs, dependent: :destroy

	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
    has_many :followed_users, through: :relationships, source: :followed
    
	has_secure_password
    before_save :create_remember_token
	
	validates :name, :presence => true, :length => { :maximum => 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true, 
			:format => { :with => VALID_EMAIL_REGEX }, 
			:uniqueness => { :case_sensitive => false } 
	VALID_PASSWORD_REGEX = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/
	validates :password, :length => { :minimum => 8 },
			:format => { :with => VALID_PASSWORD_REGEX }
	validates :password_confirmation, :presence => true
	
	private

	  def create_remember_token
        self.remember_token = SecureRandom.base64
      end
end
