class JobsController < ApplicationController
  before_action :set_company, except: [:update, :city_sort]
  before_action :set_job, except: [:index, :create, :new, :city_sort]

  def index
    @jobs = @company.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to company_jobs_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_path(@company)
  end

  def city_sort
    byebug
    @jobs = city_find
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city,
                                :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def self.sort_level_of_interest
    @jobs = Job.sort(:level_of_interest).reverse
  end

  def self.group_level_of_interest
    @grouped_jobs = Job.where
  end

  def city_find
    Job.where(city: params[:name])
  end

  def self.all_cities
    Job.distinct.pluck(:city)
  end
end
