class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images, dependent: :delete_all

  accepts_nested_attributes_for :prototype_images, reject_if: :reject_image

  def main_image
    prototype_images.main.first!
  end

  def sub_images
    prototype_images.sub
  end

  def reject_image(attributed)
    attributed["name"].blank?
  end
end
