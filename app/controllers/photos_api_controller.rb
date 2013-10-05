class PhotosApiController < ApplicationController

	# GET /photo_api
	# Array of Hashes to be iterated over
	def index
		@photos = Photo.all

    array = []
    @photos.each do |photo|
    	photo_push = {
    		id: photo.id,
    		name: photo.name,
    		photo: photo.photo.url
    	}

    	array << photo_push
    end

    render json: array
	end

	# GET /photos_api/show/1.json
	def show
		@photo = Photo.find(params[:id])

		render json: @photo
	end

	# POST /photos_api
	def create
		# need to understand iOS better to do this
	end

	# PUT /photos_api/1
	def update
		# need to understand iOS better to do this
	end

	# DELETE /photos_api/1
	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy

		render json: @photo
	end

end