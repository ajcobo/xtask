class CreateGroupMutants < ActiveRecord::Migration
  def change
    create_table :group_mutants do |t|
      t.references :mutant, index: true
      t.references :group, index: true

      t.timestamps null: false
    end
    add_foreign_key :group_mutants, :mutants
    add_foreign_key :group_mutants, :groups
  end
end
