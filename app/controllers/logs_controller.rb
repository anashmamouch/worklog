class LogsController < ApplicationController

	def index
		@logs = Log.all.order('created_at DESC')
	end

	def create
		@log = Log.new(log_params)
		@log.save

		redirect_to root_url
	end

	private
		def log_params
			params.require(:log).permit(:title, :body)
		end
end
