require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'lib/tag'
require_relative 'lib/link'
require_relative 'lib/user'

#set up a connection with the database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}")
#checking that everything we wrote / the way we structured it is correct
DataMapper.finalize
DataMapper.auto_upgrade!
