class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pictures
  
  has_attached_file :avatar, 
  									:styles => {  :medium => "300x300>", 
  																:thumb => "100x100>", 
  																:large => "600>" },
                    :path => ":class/:id/:style.:extension",
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :storage => :s3

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
