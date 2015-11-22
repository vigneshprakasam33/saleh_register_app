class CreateRegisters < ActiveRecord::Migration
 def self.up
    create_table :registers do |t|
      t.column        :username,     :string
      t.column        :password,     :string
      t.column              :q1,     :string
      t.column              :q2,     :string
      t.column              :q3,     :string
      t.column           :state,     :integer

    end
  end
 
  def self.down
    drop_table :registers
  end
end
