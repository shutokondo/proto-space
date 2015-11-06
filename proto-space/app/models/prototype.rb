class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :prototype_images, dependent: :delete_all
  has_many :comments

  accepts_nested_attributes_for :prototype_images, reject_if: :reject_image

  validates_presence_of :title, :prototype_images

  acts_as_taggable

  def main_image
    prototype_images.main.first!
  end

  def sub_images
    prototype_images.sub
  end

  def reject_image(attributed)
    attributed["name"].blank?
  end

  def user_like(prototype)
    user.likes.exists?(prototype_id: prototype)
  end

end
