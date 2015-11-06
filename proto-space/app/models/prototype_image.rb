class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  enum property: %i(main sub)
  mount_uploader :name, ImageUploader
  validates :name, presence: true
end
