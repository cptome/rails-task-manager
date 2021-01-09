class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create 
    @task = Task.create(task_params)
    @task.save
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end


  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect to tasks_path
  end


  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
