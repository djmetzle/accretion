# Accretion Backend Configuration

class BackendConfig
	attr_reader :db_host
	attr_reader :db_is_replica_set

	attr_reader :credentials

	@db_host = nil
	@db_is_replica_set = false

	@credentials = nil

	def initialize
		fetch_env_vars
	end

	private
	def fetch_env_vars
		puts "Fetch Environment"
		spec = ENV['CREDENTIALS_SPEC'] || nil
		unless spec
			# default to local
			@db_host = 'mongo_local'
			return
		end
		# otherwise fetch
		fetch_credentials(spec)
	end

	def fetch_credentials(spec)
		puts "Pull credentials"
		p spec
	end
end
