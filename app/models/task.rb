class Task < ActiveRecord::Base
	# FK - project_id 
	
	belongs_to :project

	validate :check_due_date

	def details
		"#{self.title.upcase} - #{self.due_date.strftime("%A, %d %B %Y")}"
	end

	private 

	def check_due_date 
		if self.due_date < self.project.start_date
			errors.add(:due_date, "Invalid Date")
		end
	end

end
