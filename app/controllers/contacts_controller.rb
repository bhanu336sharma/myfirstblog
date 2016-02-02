class ContactsController < ApplicationController
	def create
    	@student = Student.find(params[:student_id])
    	@contact = @student.contacts.create(contact_params)
    	redirect_to student_path(@student)
    end
    def show
    	@student = Student.find(params[:student_id])
    end

     
 
  private
    def contact_params
      params.require(:contact).permit(:phone_no, :house_no, :street_no, :city)
    end
end
