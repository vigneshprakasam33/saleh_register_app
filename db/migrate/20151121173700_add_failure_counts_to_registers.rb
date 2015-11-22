class AddFailureCountsToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :failure_counts, :integer , :default => 0
  end
end
