Taskr::Application.routes.draw do
  devise_for :users

root :to=>"welcome#index"
#/buckets/1/tasks
#/buckets/1/tasks/pending
#/buckets/1/tasks/done
#POST/tasks/1/done/complete to complete

 resources :buckets, :shallow=>true do
   member do
     post 'share'
   end
  resources :tasks do
    collection do
      match 'done'
      match 'pending'
    end
    member do
      post 'complete'
    end  
   end
 end
 resources :tasks, :only => [:index]
end
