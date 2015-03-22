class Group < ActiveRecord::Base
  has_many :group_mutants
  has_many :mutants, through: :group_mutants
  has_many :tasks, as: :taskable

  validates :name, presence: true
  accepts_nested_attributes_for :tasks

end
