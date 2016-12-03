class ProjectsController < ApplicationController

	before_action :authenticate_user!
	def index
		@projects = current_user.projects
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to @project, notice: "Success"
		else
			render action: "new"
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	private
	def project_params
		params[:project].permit(:name, :description, :client_id, :status, :start_date, category_ids: [])
	end
end
