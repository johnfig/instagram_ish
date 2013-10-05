class PhotosApiController < ApplicationController

	def index
		@photos = Photo.all

		# respond_to do |format|
  #     format.json { render json: @photos }
  #   end
    hash = {}
    @photos.each do |photo|
    	@single_hash = {
    		id: photo.id,
    		name: photo.name,
    		photo: photo.photo.url
    	}
    	ap @single_hash
    end

    plist = @single_hash
    render json: plist
	end

	def show
		@photo = Photo.find(params[:photo_id])

		@photo.to_json
	end

	def create
		# need to understand iOS better to do this
	end

	def update
		# need to understand iOS better to do this
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		@photo.destroy
	end

end