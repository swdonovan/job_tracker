class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :set_job, :set_company, only: [:create]


  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_to company_job_path(@company, @job), notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:id]) if params[:comment_id]
    @commentable = Job.find_by_id(params[:job_id]) if params[:job_id]
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_company
    @company = @job.company
  end
end
