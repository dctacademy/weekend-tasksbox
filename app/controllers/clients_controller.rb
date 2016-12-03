class ClientsController < ApplicationController

	before_action :authenticate_user!

	def index
		@clients = current_user.clients
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		@client.gender = determine_gender(@client.name)
		if @client.save
			redirect_to clients_path, notice: "successfully created #{@client.name}"
		else
			render action: "new"
		end
	end

	def show
		begin 
			@client = current_user.clients.find(params[:id])
			@projects = Project.where('client_id = ?', @client.id)
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "Record Not Found"
		end
	end

	def edit
		#@client = Client.find(params[:id])
		@client = fetch_record
	end

	def update
		@client = fetch_record
		#@client = Client.find(params[:id])
		@client.user_id = current_user.id
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id), notice: "successfully updated client #{@client.name}"
		else
			render action: "edit"
		end
	end

	def destroy
		@client = fetch_record
		#@client = Client.find(params[:id])
		@client.destroy 
		redirect_to clients_path, notice: "successfully Deleted #{@client.name}"
	end


	private

	def determine_gender(name)
		response = HTTParty.get("https://api.genderize.io/?name=#{name}")
		return response.parsed_response["gender"]
	end

	#strong parameters 
	def client_params
		params[:client].permit(:name,:company,:email,:mobile)
	end

	def fetch_record
		begin 
			client =  Client.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "Record Not Found"
		end
			return client
	end

end


=begin 
index 
new
create
show
edit
update
destroy
=end

