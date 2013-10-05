require 'spec_helper'

describe PhotosApiController do
	it "test" do
		photo = FactoryGirl.create :photo 
		ap photo

		get :index

		# puts response.json
	end
end