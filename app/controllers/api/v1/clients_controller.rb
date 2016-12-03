module Api
	module V1
		class ClientsController < ApplicationController

			before_action :authenticate_user!

			def index
				@clients = current_user.clients
			end

			def show 
				begin 
					@client = current_user.clients.find(params[:id])
				rescue ActiveRecord::RecordNotFound
					@error_msg = "Record Not Found"
				end
			end
			
		end
	end
end