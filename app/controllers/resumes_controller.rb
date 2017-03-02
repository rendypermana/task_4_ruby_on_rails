class ResumesController < ApplicationController
  def index
      @resumes = Resume.all
   end
   
   def new
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      
      if @resume.save
         redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
      
   end

   def edit
   		@resume = Resume.find_by_id(params[:id])
   end

   def update
   		@resume = Resume.find_by_id(params[:id])
 	   	if @resume.update(resume_params)
    	flash[:notice] = "Success Update Records"
    	redirect_to action: 'index'
    	else
    	flash[:error] = "data not valid"
    	render 'edit'
    	end
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
   end
   
   private
      def resume_params
      params.require(:resume).permit(:name, :attachment)
   end
end
