class ProjectsController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_projects
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:show]

  # GET /projects
  # GET /projects.json
  def index

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = @user.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: 'Project was successfully created.'}
        format.json {render :show, status: :created, location: @project}
      else
        format.html {render :new}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to @project, notice: 'Project was successfully updated.'}
        format.json {render :show, status: :ok, location: @project}
      else
        format.html {render :edit}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url, notice: 'Project was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_projects
    @projects = @user.projects
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = @projects.find(params[:id])
  end

  def set_tasks
    @tasks = @project.tasks
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    # params.require(:project).permit(:name, :tag)
    {name: params[:name]}
  end
end
