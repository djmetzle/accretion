# Accreation Backend Singleton

require_relative './config'
require_relative './connection'

class Backend
	# Backend Configuration (static)
	@@config = nil
	# DB Connection (static)
	@@connection = nil

	def self.save(collection, payload)
		unless @@config
			@@config = BackendConfig.new
		end
		unless @@connection
			@@connection = BackendConnection.new(@@config)
		end
		client = @@connection.get_client
		# w00t
		puts "w00t"
	end

	private
	def self.internal
		puts "internal"
	end
end
