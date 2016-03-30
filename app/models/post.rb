class Post < ActiveRecord::Base
  belongs_to :road_trip
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end