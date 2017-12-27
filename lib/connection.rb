# Backend DB Connection (MongoDB)

require 'mongo'

class BackendConnection
	def initialize(config)
		puts "Instantiate Connection"
		@config = config
		connect
	end

	def connect
		unless @client
			p @config
			@client = Mongo::Client.new(
					[@config.db_host],
					:database => 'warehouse')
		end
	end

	end
end
