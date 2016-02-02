# class Ability
#   include CanCan::Ability
#   def initialize(user)
#   	if user.role == 'admin' 	
#   		can :manage, :all
#   	elsif user.role == 'student'
#   		can :read, :all
#   		can :create, Contact
#   	else
#   		can :read, Contact
#       can :read, Student
#   	end
#   end
# end