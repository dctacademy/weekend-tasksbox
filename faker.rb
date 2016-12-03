10.times do 
	client = Client.new
	client.name = Faker::Name.first_name
	client.email = Faker::Internet.free_email(client.name)
	client.company = Faker::Company.name 
	client.mobile = Faker::Number.number(10)
	client.save
end

50.times do 
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.client_id = Client.all.pluck(:id).sample
	project.status = ["new", "on-going","completed"].sample
	project.start_date = Faker::Date.between(Date.parse("2015-06-01"), Date.today)
	project.save
end


100.times do 
	task = Task.new
	task.title = ["vendor finalization", "Graphic", "logo", "Development"].sample
	project = Project.all.sample
	task.project_id = project.id
	task.is_completed = [true,false].sample
	task.due_date = Faker::Date.between(project.start_date, project.start_date + 2.weeks)
	task.save
end

projects = Project.where('start_date > ? AND (status = ? OR status = ?)', Date.today.beginning_of_month, "new", "completed")

10.times do 
	ProductCategory.create(name: Faker::Commerce.department(1))
end

10.times do 
	Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price)
end


