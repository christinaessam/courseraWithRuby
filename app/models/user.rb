class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # enum gender: { male:0, female:1}
  mount_uploader :img, ImageUploader
  has_many :lectures,:dependent=>:delete_all
  has_many :courses,:dependent=>:delete_all
  has_many :comments,:dependent=>:delete_all
  acts_as_voter

  validates :name , :presence=>true
  validates :email , :presence=>true
  validates :email , :uniqueness=>true

end
