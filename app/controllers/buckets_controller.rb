class BucketsController < ApplicationController
  before_filter :authenticate_user!
  
def index
  @buckets = current_user.buckets
end

def new
  @bucket = current_user.buckets.build
end

def create
  @bucket = Bucket.new(params[:bucket])
  @bucket.user = current_user
  if(@bucket.save)
    redirect_to bucket_tasks_path(@bucket), :notice=> "Bucket Created"
  else
    render :action=>:new
  end
end

def share
  share = params[:share]
  @bucket = Bucket.find(params[:id])
  Share.by_email(@bucket,share[:name],share[:email]).deliver
  redirect_to bucket_tasks_path(@bucket)
end  

def destroy

end

def show

end

def edit

end

def update

end

end
