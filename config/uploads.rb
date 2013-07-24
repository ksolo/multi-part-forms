require 'carrierwave'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.store_dir = 'public/uploads/'
end