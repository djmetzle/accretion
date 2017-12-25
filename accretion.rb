require 'sinatra'

require_relative './lib/post_controller.rb'

class Accretion < Sinatra::Base
	set :root, File.dirname(__FILE__)

	get '/warehouse/health' do
		"HEALTHY"
	end

	register Sinatra::Accretion::PostController
end
