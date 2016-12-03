class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Successfully created task"
		else
			redirect_to project_path(@task.project_id), notice: "Invalid Date" 
		end
	end


	def mark_as_complete 
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: true)
		Notification.task_completed(@task).deliver
		#sleep 2
		redirect_to :back, notice: "Marked task as complete"
		# request.env["HTTP_REFERRER"] == :back
	end

	def mark_as_incomplete 
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: false)
		redirect_to :back, notice: "Marked task as incomplete"
	end

	private

	def task_params
		params[:task].permit(:project_id,:title, :is_completed, :due_date)
	end
end
