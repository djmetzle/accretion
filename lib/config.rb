# Accretion Backend Configuration

require 'aws-sdk-s3'

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
		region_name = ENV['CREDENTIALS_REGION'] || 'us-east-1'
		bucket_name = ENV['CREDENTIALS_BUCKET']
		key_name = ENV['CREDENTIALS_KEY']
		unless bucket_name and key_name
			puts "defaulting to local db"
			@db_host = 'mongo_local'
			return
		end
		puts "fetching credentials from S3"
		fetch_credentials(region_name, bucket_name, key_name)
	end

	def fetch_credentials(region, bucket, key)
		puts "Pull credentials"
		s3 = Aws::S3::Resource.new(region: region)
		obj = s3.bucket(bucket).object(key)
		credentials_content = obj.get.body.read
		unpack_credentials(credentials_content)
	end

	def unpack_credentials(credentials)
		db_credentials = JSON.parse(credentials)
		
		p db_credentials

		@db_host = db_credentials["db_host"]

		@credentials = {}

		@credentials[:username] = db_credentials["username"]
		@credentials[:password] = db_credentials["password"]

		@db_is_replica_set = db_credentials["db_is_replica_set"]
		if @db_is_replica_set
			@credentials[:replica_set] = db_credentials["replica_set"]
		end
	end
end
