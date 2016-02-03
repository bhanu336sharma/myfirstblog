class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome(student)
  	@student = student
  	@url = "/students/new"
  	mail(to: @student.email, subject: "welcome new user")
  end 
  handle_asynchronously :welcome
end