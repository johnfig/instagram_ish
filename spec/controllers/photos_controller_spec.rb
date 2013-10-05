require 'spec_helper'

describe PhotosController do
		
		it 'should show all photos' do
			photo = FactoryGirl.create :photo 

			get :index

			# ap response.json
		end

end