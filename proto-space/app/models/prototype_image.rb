class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  enum property: %i(main sub)
  mount_uploader :name, ImageUploader
end
