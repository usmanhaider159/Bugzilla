class BugsController < ApplicationController
	before_action :find_bug, only: [:show , :edit , :update , :destroy]
	before_action :find_project , only: [:new , :index , :create]
	def index
		@bugs = @project.bugs
	end

	def create
		@bug= @project.bugs.create!(bug_params)
		respond_to do |format|
			if @bug.save
				format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
	      format.json { render :show, status: :created, location: @bug }
			else
		    format.html { render :new }
		    format.json { render json: @bug.errors, status: :unprocessable_entity }
	    end
  	end
	end

	def new	
		@bug = @project.bugs.build
	end

	def edit
	end

	def show
		@user = User.find(@bug.user_id)
		if @bug.dev_id != nil
		@developer = User.find(@bug.dev_id)
		end
	end

	def update
		
	end

	def destroy

	end

	private

	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_bug
		@bug = Bug.find(params[:id])
	end
	
	def bug_params
		params.require(:bug).permit(:title, :deadline , :bugtype , :status , :avatar , :user_id, :dev_id)
	end
end