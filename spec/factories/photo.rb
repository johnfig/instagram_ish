FactoryGirl.define do
  factory :photo do
    name 'John Fig'
    photo_file_name "anything"
    photo_content_type "image/jpeg"
    photo_file_size 1
    photo_updated_at Time.now
  end
end