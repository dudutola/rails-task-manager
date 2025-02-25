class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :mark_as_completed, :destroy ]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def mark_as_completed
    @task.update(completed: !@task.completed)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to @task, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
