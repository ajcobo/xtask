class AddPowerAndAvatarToMutants < ActiveRecord::Migration
  def change
    add_column :mutants, :avatar, :string
    add_column :mutants, :power, :string
  end
end
