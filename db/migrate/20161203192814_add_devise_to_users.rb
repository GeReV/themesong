class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.string :email,              null: false, default: ''
      t.string :name,               null: false, default: ''
      t.string :image,              default: ''

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
