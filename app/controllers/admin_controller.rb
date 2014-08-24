class AdminController < ApplicationController
	layout "admin"
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	before_action :set_title, only: [:index, :edit, :update]
def set_title
	@name = Page.find(1)
end

	def index
		@title = @name.title
		@p1 = @name.p1
		def index
    @client_ip = remote_ip()
  end
	end
	def edit
	end
	def update
		if @name.update_attributes(title_params)
			flash[:notice] = 'You have successfully changed the title!',
			redirect_to(:controller => 'admin', :action => 'index')

		else 
			flash[:notice] = 'Sorry, title can\'t be empty.'
			redirect_to(:controller => 'admin', :action => 'index')
		end
	end
private

def title_params
	params.require(:page).permit(:id, :title, :p1)
end
end