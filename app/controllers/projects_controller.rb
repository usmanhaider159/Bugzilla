class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_member]

  # GET /projects
  # GET /projects.json
  def index
    if current_user.user_type=='project_manager'
      @projects = Project.all
    else
    @projects = current_user.projects
  end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.create!(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_member
    @user= User.find_by(id:params[:userid])
    @project= Project.find_by(id:params[:projectid])
    @project.users.delete(@user)
    redirect_to @project
  end

  def add_member
      # @project = Project.find_by(id: params[:id])
      @ids = params[:project][:user_ids]
      @ids.reject!(&:blank?)
      @ids.each do |id|
        @user=User.find_by(id: id)
        @project.user_projects.create!(user: @user)
      end
      
      respond_to do |format| 
      format.html { redirect_to @project, notice: 'Member was successfully added.' }
      format.json { render :show, status: :ok, location: @project }
  end
end
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, user_ids: [])
    end

end