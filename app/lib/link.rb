require 'data_mapper'
require 'dm-postgres-adapter'


class Link

include DataMapper::Resource

property :id , Serial
property :title , String
property :url , String


end

#set up a connection with the database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}")
#checking that everything we wrote / the way we structured it is correct
DataMapper.finalize
#build the columsn and rows
DataMapper.auto_upgrade!
