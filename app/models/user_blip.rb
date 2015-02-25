class UserBlip < ActiveRecord::Base
  belongs_to :user
  belongs_to :blip
end
