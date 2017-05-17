class TasksController < ApplicationController

# filter
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks =  Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to tasks_pathath
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def delete
  end
end

# Not so DRY, many commands are repeated (Task.find(params[:id])) let's use a FILTER!

private
def task_params
  params.require(:task).permit(:name, :description)
end

def set_task
  @task = Task.find(params[:id])
end
