class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_title, only: [:index, :edit, :update, :new, :show]
  protect_from_forgery with: :exception
	def set_title
		@title = Title.find(1)
		@content = Page.find(1)
	end


	private

	def title_params
		params.require(:title).permit(:id, :title, :image)
	end
	def mobile_device?
		request.user_agent =~ /Mobile|webOS/
	end
	helper_method :mobile_device?
end
