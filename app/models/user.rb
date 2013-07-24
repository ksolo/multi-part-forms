class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
