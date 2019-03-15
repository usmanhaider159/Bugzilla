class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

	def new?
   if @user.user_type=="project_manager"
          return true
   else 
          return false
   end
  end
  
	def create?
	 if @user.user_type=="project_manager"
          return true
    else 
          return false
    end
	end
 
  def update?
    if @user.user_type=="project_manager" && @record.users.first == @user
          return true
    else 
          return false
    end
  end
 
  def destroy?
    if @user.user_type=="project_manager" && @record.users.first == @user
          return true
      else 
          return false
    end	
  end

  def add_member? 
    if @user.user_type=="project_manager" && @record.users.first == @user
          return true
      else 
          return false
    end 
  end
  def delete_member?
    if @user.user_type=="project_manager" && @record.users.first == @user
          return true
      else 
          return false
    end 
  end
end