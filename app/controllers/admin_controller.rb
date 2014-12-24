class AdminController < ApplicationController
	layout "admin"
	before_action :authenticate_user!
	protect_from_forgery with: :exception
	
def gallery
	@title = Title.find(1)
	@content = Page.find(1)
	@page = Page.new
	@photos = Photo.all
	@photo = Photo.new
	@headers = Header.all
	@header = Header.new
end
def news
	@title = Title.find(1)
	@news = News.all
end
def save
	image = Image.new
	image.image = params[:file]
    image.save!
    redirect_to :back
	
end
	
	def created
		@title = Title.new
		if @title.save
			flash[:notice] = "You have created the title"
			redirect_to(:back)
		else
			flash[:notice] = "You have not created the title"
			redirect_to(:back)
		end
	end
	def show
		@title = Title.find(params[:id])
	end
	def update
		if @title.update_attributes(title_params)
			flash[:notice] = 'You have successfully changed the title!'
			redirect_to(:back)

		else 
			flash[:notice] = 'Sorry, title can\'t be empty.'
			redirect_to(:controller => 'admin', :action => 'index')
	end
	
end
private

def title_params
	params.require(:title).permit(:id, :title, :image)
end
def image_params
  params.require(:image).permit(:image)
end
end
