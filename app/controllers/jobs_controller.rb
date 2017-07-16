class JobsController < ApplicationController
  before_action :set_company, except: [:update]
  before_action :set_job, except: [:index, :create, :new]

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
    @jobs = Jobs.where(city: params[:city])
  end

  private

  def job_params
    if params[:job]
    params.require(:job).permit(:title, :description, :level_of_interest, :city,
                                :category_id)
    else
      redirect_to new_company_contact_path
    end
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
