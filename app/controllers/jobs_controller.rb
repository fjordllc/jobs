# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :require_company!, only: %i[new create edit update destroy]
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job, notice: '求人を登録しました。'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: '求人を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: '求人を削除しました。'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
