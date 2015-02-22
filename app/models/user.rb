class User < ActiveRecord::Base



  attr_accessor :password

  validates_confirmation_of :password
  validates_confirmation_of :email
  before_save :encrypt_password

  validates :email, uniqueness: true
  validates_format_of :email, :with => /@/ 

  has_many :blipped_users, through: :user_blips, source: :blip
  has_many :user_blips, dependent: :nullify






  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end


  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
