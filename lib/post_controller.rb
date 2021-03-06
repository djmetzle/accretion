# Accreation Post Controller

require 'json'

require_relative  './backend'

module Sinatra
	module Accretion
		module PostController
			def self.registered(app)
				def app.handle_post(collection,payload)
					# save payload to collection
					Backend.save(collection,payload)
					return
				end

				app.post '/warehouse/:collection' do
					request.body.rewind
					begin
						payload = JSON.parse request.body.read
					rescue
						halt 400
					end
					app.handle_post(params[:collection], payload)
				end
			end
		end
	end
end
