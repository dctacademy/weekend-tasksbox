object @client
attributes :name, :company, :mobile

child :projects do 
	attributes :name, :start_date, :status
end

child :user do 
	attributes :email
end