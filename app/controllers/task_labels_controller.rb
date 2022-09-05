# frozen_string_literal: true

class TaskLabelsController < ApplicationController
  before_action :set_task_label, only: %i[show edit update destroy]

  def index
    @task_labels = TaskLabel.all
  end

  def show; end

  def new
    @task_label = TaskLabel.new
  end

  def edit; end

  def create
    @task_label = TaskLabel.new(task_label_params)

    respond_to do |format|
      if @task_label.save
        format.html { redirect_to task_label_url(@task_label), notice: 'Task label was successfully created.' }
        format.json { render :show, status: :created, location: @task_label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_label.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task_label.update(task_label_params)
        format.html { redirect_to task_label_url(@task_label), notice: 'Task label was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_label }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_label.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_label.destroy

    respond_to do |format|
      format.html { redirect_to task_labels_url, notice: 'Task label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_task_label
    @task_label = TaskLabel.find(params[:id])
  end

  def task_label_params
    params.permit(:task_id, :label_id)
  end
end
