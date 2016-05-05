class Lecture < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  mount_uploader :attachment, FileUploader
  has_many :comments,:dependent=>:delete_all
  acts_as_votable

  validates :title , :presence=>true

end
