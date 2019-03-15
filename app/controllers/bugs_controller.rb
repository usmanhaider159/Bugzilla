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
		@user = Creator(@bug)
		if @bug.dev_id != nil
		@developer = User.find(@bug.dev_id)
		end
	end

	def update
		if @bug.update(bug_params)
			flash[:sucess]= "sucessfuly updated!"
			redirect_to @bug
		else
			flash[:alert]="not updated!"
			render 'edit'
		end
	end

	def destroy
		@bug.destroy
		flash[:sucess]= "sucessfuly deleted!"
		redirect_to project_bugs_path(@bug.project_id)
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
	def Creator(bug)
		bug.user
	end
end