class JobsController < ApplicationController
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    
    def index
        @jobs = Job.all.order("created_at DESC")
    end
    
    def show
        
    end
    
    def new
        @job = Job.new
    end
    
    def create
        @jobs = Job.new(job_params)
        
        if @jobs.save
            redirect_to @jobs
        else
            render 'new'
        end
    end
    
    def update 
       if @job.update(job_params)
        redirect_to @job
    else
        render 'edit'
    end
    end
    
    def edit
        
    end
    
    def destroy
        @job.destroy
        redirect_to root_path
    end
    
    private 
     def job_params
         params.require(:job).permit(:title, :description,:company, :url)
     end
     
     def find_job
         @job = Job.find(params[:id])
     end
    
    
    
end
