class PagesController < ApplicationController
	layout "pages"
	before_action :set_name, only: [:index, :edit, :update]
	def set_name
	@content = Page.find(1)
end
	def show
	
	end
def new
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
end
def services
	@newsletter = Page.new
	@name = Page.find(1)
	@title = @name.title
	@content = Page.find(1)
end
def contact
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
end
def gallery
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
	@images = Dir.glob('app/assets/images/gallery/*')
end
def update
	@name = Page.find(1)
	if @content.update_attributes(title_params)
			flash[:error] = 'You have successfully changed the p1!'
			redirect_to(:back)

		else 
			flash[:error] = 'Sorry, title can\'t be empty.'
			redirect_to(:controller => 'admin', :action => 'index')
	end
end

def create
	@title = Title.new(title_params)
	if @title.save
 			flash[:notice] = 'You have successfully registered!'
 			redirect_to(:controller => 'pages', :action => 'new')
	else 
			flash[:notice] = 'Sorry, your email is not valid..'
			redirect_to(:controller => 'pages', :action => 'new')
	end
end

private
def title_params
	params.require(:page).permit(:id, :title, :p1)
end
end
