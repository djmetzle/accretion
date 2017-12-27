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

		# clean collection name to lower alpha only
		collection = collection.downcase.gsub!(/\W/,'')

		# set a timestamp for this payload
		payload[:timestamp] = Time.now.to_i

		client = @@connection.get_client

		client[collection].insert_one(payload.to_h)
	end

	private
	def self.internal
		puts "internal"
	end
end
