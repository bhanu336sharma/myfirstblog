class StudentsController < ApplicationController
	def index
    @student = Student.page(params[:page]).per(3)# @student = Student.all
	end

  def student_list
     @student = User.page(params[:page]).per(3)    # @student = User.all
  end
  
  def teacher_list
    @teacher = User.all
  end

	def show
  	@student = Student.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

	def new
		@student = Student.new
	end

	def send_mail
		@student = Student.find(params[:id])
		UserMailer.welcome(@student).deliver
	end

	def create
		@student = Student.create(student_params)
		UserMailer.welcome(@student).deliver
		if @student.save
   			redirect_to @student, notice: "Student created sucessfully."
 		else 
 			render 'new', alert: "Invalid request."
 	  end
	end

	def edit
		@student = Student.find(params[:id])
	end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
       redirect_to "/students", notice: "Record updated."
    else
       redirect_to "/students", notice: "try again"
    end
  end

  def update_check
  	@student = Student.find(params[:id])
  	if params["data"] == "true" 
  		@student.check = true
  	else
  		@student.check = false
  	end
  	@student.save
  	render :json => {:get_data => @student}# render :nothing => true  	
  end

  def status    
    @student = Student.find(params[:id]) 
  end


  def status_update
  	@student = Student.find(params[:id]) 
  	if params["data"] == "pass"
  		@student.check = false
  	else
  		@student.check = true
  	end
  	@student.save
  	render :nothing => true
  end

  def restatus_update
  	@student = Student.find(params[:id]) 
  	if params["data"] == "pass"
  		@student.check = true
  	else
  		@student.check = false
  	end
  	@student.save
  	render :nothing => true
  end

  def destroy
  	@student = Student.find(params[:id])
  	@student.destroy
  	redirect_to "/students", notice: "Record deleted."
  end

	def student_params
		params.require(:student).permit(:name,:roll_no, :email, :check, :photo)
	end
end