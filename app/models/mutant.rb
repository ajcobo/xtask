class Mutant < ActiveRecord::Base
  rolify
  has_many :group_mutants
  has_many :groups, through: :group_mutants
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  mount_uploader :avatar, AvatarUploader
end
