require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, String, length: 60

  validates_confirmation_of :password
  #validates_presence_of    :email
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
