class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true

  validates :name, :taskable, presence: true

end
