class Picture < ActiveRecord::Base
	extend FriendlyId
	belongs_to :user
	friendly_id :title, use: :slugged
	has_attached_file :image, 
  									:styles => {  :medium => "300x300>", 
  																:thumb => "100x100>", 
  																:large => "600>" },
										:path => ":class/:id/:style.:extension",
									  :s3_credentials => "#{Rails.root}/config/s3.yml",
									  :storage => :s3


  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
end
