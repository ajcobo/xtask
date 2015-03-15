class GroupMutant < ActiveRecord::Base
  belongs_to :mutant
  belongs_to :group
end
