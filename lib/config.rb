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
		fetch_credentials
	end

	private
	def fetch_env_vars
		puts "Fetch Environment"
	end

	def fetch_credentials
		puts "Pull credentials"
	end
end
