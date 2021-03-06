class PagesController < ApplicationController
	layout "pages"
	before_action :set_name, only: [:index, :edit, :update, :vote_for_article]
	def set_name
	@content = Page.find(1)
end
def new
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
	@headers = Header.all
end
def services
	@newsletter = Page.new
	@name = Page.find(1)
	@title = @name.title
	@content = Page.find(1)
	@headers = Header.all
end
def contact
	@newsletter = Page.new
  	@booking = Booking.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
	@headers = Header.all
end
def createbooking
	@booking = Booking.new
	@headers = Header.all
end
def gallery
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
	@photos = Photo.all
	@photo = Photo.new
	@headers = Header.all
	@header = Header.new

end
def articles
	@newsletter = Page.new
	@titles = Title.find(1)
	@title = @titles.title
	@content = Page.find(1)
	@headers = Header.all
	@header = Header.new
	shit = News.all
	if shit.count > 0
		@lastarticle = News.last	
	else
		News.create!(:id => "1", :title => "Demo", :content => "Demo content", :img_url => "demo.png", :votes => "2")
		@lastarticle = News.last
	end
	@lastthree = News.last(4)
	@lastthree = @lastthree.first(3)
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

def booking
  @booking = Booking.new(booking_params)
	if @booking.save
 			flash[:notice] = 'Your booking is succesfull!'
 			PersonMailer.welcome_email(@booking).deliver
 			redirect_to(:controller => 'pages', :action => 'contact')
	else 
			flash[:notice] = 'Sorry, something went wrong..try again !'
			redirect_to(:controller => 'pages', :action => 'contact')
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
	def booking_params
	  params.require(:booking).permit(:id, :name, :phone, :date, :select_option, :email, :comments, :time)
	end
end
