class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :language, {:null => false}
      t.string :page, {:null => false}
      t.text :description, {:limit => 4294967295, :default => nil}

      t.timestamps
    end
    add_index :templates, [:language, :page], :unique => true
  end

  def self.down
    drop_table :templates
  end
end
