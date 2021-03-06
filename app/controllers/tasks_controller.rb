class TasksController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_project, :set_tasks, only: [:create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html {redirect_to request.referrer || @task, notice: 'Task was successfully created.'}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to @task, notice: 'Task was successfully updated.'}
        format.json {render :show, status: :ok, location: @task}
      else
        format.html {render :edit}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_url, notice: 'Task was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_tasks
    @tasks = @project.tasks
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = @user.projects.find(params[:project_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    {name: params[:name]}
    # params.require(:task).permit(:name, :prioritize, :done, :deadline, :project_id)
  end
end
