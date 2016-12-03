class SayController < ApplicationController

	def hello 
	
	end

	def clients
		@clients = Client.order('name')
	end

	def projects
		@projects = Project.order('start_date DESC')
	end

	def products
		@products_by_brand
		@products_by_range
	end


	def jobs
		if params[:technology]
			tech = params[:technology]
			location = params[:location]
			@response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{tech}&l=#{location}&co=india&format=json&v=2").parsed_response
			save_info(@response)
		end
	end

	def zomato

	end

	private 
	def save_info(response)
		response["results"].each do |result|
			job = Job.new
			job.title = result["jobtitle"]
			job.company = result["company"]
			job.address = result["address"]
			job.js = result["snippet"]
			job.save
		end
	end

end
