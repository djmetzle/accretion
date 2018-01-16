# Backend DB Connection (MongoDB)

require 'mongo'

class BackendConnection
	def initialize(config)
		puts "Instantiate Connection"
		@config = config
		connect
	end

	def connect
		p @config
		@client = Mongo::Client.new(
				[@config.db_host],
				:database => 'warehouse',
				:user => @config.credentials[:username],
				:password => @config.credentials[:password],
		)
	end

	def get_client
		if test_client
			return @client
		end
		reconnect
		return @client
	end

	def test_client
		@client.database.collection_names rescue reconnect
		return true
	end

	def reconnect
		@client.reconnect
	end
end
