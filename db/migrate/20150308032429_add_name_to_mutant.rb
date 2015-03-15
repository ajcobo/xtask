class AddNameToMutant < ActiveRecord::Migration
  def change
    add_column :mutants, :name, :string
  end
end
