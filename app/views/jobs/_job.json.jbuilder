json.extract! job, :id, :title, :company, :address, :js, :created_at, :updated_at
json.url job_url(job, format: :json)