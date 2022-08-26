# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    query = task_all
    query = query.search_keyword(search_params['keyword']) if search_params['keyword'].present?
    query = query.search_status(search_params['status']) if search_params['status'].present?
    query = query.sort_by_keyword(search_params['sort']) if search_params['sort'].present?

    @tasks = query
    @total_count = task_all.count
    @searched_count = query.count
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: 'タスクが正常に作成されました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: 'タスクが正常に更新されました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'タスクが正常に削除されました' }
      format.json { head :no_content }
    end
  end

  private

  def task_all
    @task_all ||= Task.all
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def search_params
    params.permit(:keyword, :status, :sort)
  end

  def task_params
    params.require(:task).permit(:name, :end_date, :priority, :status, :explanation).merge(user_id: current_user.id)
  end
end
