collection @clients
attributes :name, :company, :email

child :projects do 
	attributes :name, :status

	child :tasks do 
		attributes :title, :is_completed
	end
end