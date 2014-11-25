class HeadersController < ApplicationController
	def create
	    @header = Header.new(header_params)
    if @header.save
      flash[:notice] = "Header saved!"
      redirect_to :back
    else
      render 'new'
    end
   end

   def destroy
    @header = Header.destroy(params[:id])
    if @header.destroy
      flash[:notice] = "Header deleted!"
      redirect_to :back
    else
      flash[:notice] = "Header wasn't deleted!"
      redirect_to :back 
    end
  end

      private
 
  def header_params
    params.require(:header).permit(:image, :title)
  end
end
