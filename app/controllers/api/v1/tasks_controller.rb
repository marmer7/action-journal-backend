class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status:200
  end

  def create
    # task_params[:user_id]
    @task = Task.create(user_id: 1, content: task_params[:content], status: false)
    render json: @task, status: 200
  end

  def update
    @task = Task.find(task_params[:id])
    @task.update(status: !@task.status)
    @task.save
    render json: @task, status: 201
  end

  def destroy
    @task = Task.find(task_params[:id])
    @task.delete
    render json: @task, status: 200
  end

  private
  def task_params
    params.permit(:user_id, :content, :status, :id)
  end
end
