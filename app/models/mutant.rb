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

  #search http://gistflow.com/posts/428-autocomplete-with-rails-and-select2
  scope :finder, lambda { |q| where("name like :q", q: "%#{q}%") }
end
