class Core2000 < ApplicationRecord
  mount_uploader :audio, AudioUploader
  mount_uploader :image, ImageUploader
end
