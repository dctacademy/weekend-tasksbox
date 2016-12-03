class Project < ActiveRecord::Base

	# by default id is pk
	# model_name_id is the FK (naming Convention)

	has_many :tasks
	belongs_to :client
	belongs_to :user


	# has_many :join_table
	# has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories

	validates_length_of :description, minimum: 10

	#custom validation
	#validate :check_status
	validate :check_start_date


	def over_due_tasks 
		self.tasks.where('is_completed = ? AND due_date < ?', false, Date.today).order('due_date ASC')
	end

	def incomplete_tasks
		self.tasks.where('is_completed = ? AND due_date >= ?', false, Date.today).order('due_date DESC')
	end

	def completed_tasks
		self.tasks.where('is_completed = ?', true)
	end

	def self.status_statistics_hash(user)
		data = {}
		data["new"] = user.projects.where('status = ?', 'new').size
		data["on-going"] = user.projects.where('status = ?', 'on-going').size
		data["completed"] = user.projects.where('status = ?', 'completed').size
		return data
	end

	def percentage_completed 
		total_tasks = self.tasks.size 
		completed_tasks = self.tasks.where('is_completed = ?',true).size.to_f
		return ((completed_tasks / total_tasks) * 100).to_i
	end


	private

	def check_status
		if self.status != "new"
			errors.add(:status, "should be new")
		end

	 #errors.add(:status, "should be new") if self.status != "new"
	end

	def check_start_date
		if self.start_date > Date.today + 2.weeks 
			errors.add(:start_date, "Cannot be greater than 2 weeks")
		end

		if self.start_date < Date.today
			errors.add(:start_date, "Cannot be in the past")
		end
	end

end
