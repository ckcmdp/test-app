# app/controllers/api/tasks_controller.rb
module Api
  class TasksController < ApplicationController
    before_action :authorized
    before_action :set_task, only: [:assign, :complete]

    def create
      return render json: { error: 'Not authorized' }, status: :unauthorized unless current_user.admin?

      task = Task.new(task_params)
      task.created_by_id = current_user.id

      if task.save
        render json: task, status: :created
      else
        render json: { error: task.errors.full_messages }, status: 422
      end
    end

    def assign
      return render json: { error: 'Not authorized' }, status: :unauthorized unless current_user.admin?

      user = User.find_by(id: params[:user_id])

      if user
        @task.users << user
        render json: { message: 'Task assigned successfully' }, status: 200
      else
        render json: { error: 'User not found' }, status: 404
      end
    end

    def assigned
      tasks = current_user.tasks
      render json: tasks, status: 200
    end

    def complete
      if current_user.tasks.include?(@task) && @task.completed == false
        @task.update(completed: true)
        render json: { message: 'Task completed successfully' }, status: 200
      else
        render json: { error: 'Not authorized or task not assigned to you' }, status: 401
      end
    end

    private

    def task_params
      params.require(:task).permit(:title, :description)
    end

    def set_task
      @task = Task.find_by(id: params[:id])
      render json: { error: 'Task not found' }, status: 404 unless @task
    end
  end
end

