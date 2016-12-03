if !@client.nil?
object @client
attributes :name, :company, :mobile
node(:show_url) {api_v1_client_url(@client.id)}
node(:total_projects) {@client.projects.size}

child :projects do 
	attributes :name, :start_date, :status

	child :tasks do 
		attributes :title, :is_completed
	end

	node(:categories) {|project| project.categories.pluck(:name)}

end

child :user do 
	attributes :email
end

else
	node(:error) {@error_msg}
end