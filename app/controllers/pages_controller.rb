class PagesController < ApplicationController
	layout "pages"
	
	def show
	
	end
def new
	@newsletter = Page.new
	@name = Page.find(1)
	@title = @name.title
	@p1 = @name.p1
end
def about
	@newsletter = Page.new
	@name = Page.find(1)
	@title = @name.title
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
	params.require(:page).permit(:id, :title)
end
end
