class Student < ActiveRecord::Base
	has_many :contacts,  dependent: :destroy
     validates :name, length: {in: 1..10}
     #  format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, 
     validates :roll_no, length: {is: 5}
     #before_save do
 	 	#self.name = self.name.downcase
	 #end

     before_save :func1, unless: :name?#@student.name
     mount_uploader :photo, PhotoUploader
     def func1
     	self.name = "test"
     end
     
end
