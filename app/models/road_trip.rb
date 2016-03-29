class RoadTrip < ActiveRecord::Base
	has_many :stops
	belongs_to :user
	has_many :posts

  has_attached_file :feature_image, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :feature_image, :content_type => /\Aimage\/.*\Z/

end
