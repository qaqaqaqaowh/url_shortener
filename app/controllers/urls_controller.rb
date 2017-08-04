include UrlsHelper
class UrlsController < ApplicationController
	def index
		@urls = Url.all
	end

	def show
   		@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new
	end

	def create
  		@url = Url.new(url_params)
  		@url.shorten
  		if @url.save
  			# redirect_to url_path(@url)
      		redirect_to @url
  		else
      		render 'new'
  		end   
	end

	def destroy
		@url = Url.find(params[:id])
		@url.destroy
		redirect_to root_path
	end

	def short
    	url = Url.find(params[:id])
    	redirect_to url.long_url    
	end
end

private 
def url_params
    params.require(:url).permit(:long_url)
end