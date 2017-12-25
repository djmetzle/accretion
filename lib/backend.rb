# Accreation Backend Singleton

class Backend
	@@config = nil
	@@connection = nil

	def self.save(collection, payload)
		puts "Save All the Things"
		unless @@config
			# Fetch Configuration
		end
		unless @@connection
			# Standup Connection
		end
	end

	private
	def self.internal
		puts "internal"
	end
end
