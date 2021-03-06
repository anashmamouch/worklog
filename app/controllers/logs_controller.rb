class LogsController < ApplicationController

	def index
		@logs = Log.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
		fresh_when @logs
	end

	def create
		@log = Log.new(log_params)
		@log.save

		redirect_to root_url
	end

	def show
		@log = Log.find(params[:id])
		@log.destroy
		redirect_to root_url
	end
	
	def destroy
		redirect_to root_url
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	    def set_log
	      @log = Log.find(params[:id])
	    end

		def log_params
			params.require(:log).permit(:title, :body)
		end
end
