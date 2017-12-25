require 'sinatra'

get '/warehouse/health' do
	"HEALTHY"
end

post '/warehouse/:collection' do
	# handle_post(params)
end
