class TasksController < ApplicationController
  before_filter :authenticate_user!
   
  def index
  if params[:bucket_id]
    @bucket = Bucket.find(params[:bucket_id])
    @tasks = @bucket.tasks 
    @task = @bucket.tasks.build
  else
    @tasks = current_user.tasks.all 
  end  
  end
  
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @tasks = @bucket.tasks
    @task = Task.new(params[:task])
    @task.user = current_user
    if(@task.save)
      redirect_to bucket_tasks_path(@bucket)
    else
      render :action=>:index
    end
  end  
  
  def complete
    @task = Task.find(params[:id])
    @task.complete!
    redirect_to bucket_tasks_path(@task.bucket)
  end
end
