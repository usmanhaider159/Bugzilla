class ProjectPolicy < ApplicationPolicy
	def index?
  	end
 
	def create?
	    user.present?
	end
 
  	def update?
    	if user.present?
  	end
 
  	def destroy?
    	if user.present?
  	end

  private
 
    def project
      record
    end
end