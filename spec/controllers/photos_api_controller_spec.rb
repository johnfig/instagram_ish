require 'spec_helper'

describe PhotosApiController do
  let(:user)  { FactoryGirl.create :user }
	let(:photo) { FactoryGirl.create :photo, user: user }

	context "#index" do
		it "should show both photos in a nested json hash" do
			photo
			photo_2 = FactoryGirl.create :photo, name: "Other Guy", user: user
      photo_2

			get :index

			json = JSON.parse(response.body)
			json[1]['name'].should == "Other Guy"
		end
	end

	context '#show' do
		it 'should show an object json when passed a correct id' do
			get :show, id: photo.id

			json = JSON.parse(response.body)
			json['name'].should == 'John Fig'
		end
	end

	context '#create' do
		it 'test'
  end

	context '#update' do
		it 'test'
	end

	context '#destroy' do
		it 'should find an object by id and destroy it' do
			photo
			Photo.count.should == 1

			get :destroy, id: photo.id

			Photo.count.should == 0
		end
	end
end

# note time
