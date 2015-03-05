class User < ActiveRecord::Base

  has_secure_password
  # attr_accessor :password

  #RELATIONS
  has_and_belongs_to_many :blips

  has_many :sentences, through: :blips
  
  #VALIDATIONS
  # validates_confirmation_of :password
  # validates :email, uniqueness: true
  # validates_format_of :email, :with => /@/ 

  #before_save :encrypt_password

  # def encrypt_password
  #   self.password_salt = BCrypt::Engine.generate_salt
  #   self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  # end

  # def self.authenticate(email, password)
  #   user = User.where(email: email).first
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end
  
  private



end
