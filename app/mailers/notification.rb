class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.task_completed.subject
  #
  def task_completed(task)
    @task = task
    mail to: "#{@task.project.client.email}", subject: "#{@task.title} - COMPLETED", cc: "#{@task.project.user.email}"
  end
end
