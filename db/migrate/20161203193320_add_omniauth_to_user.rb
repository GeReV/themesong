class AddOmniauthToUser < ActiveRecord::Migration[5.0]
  def change
    create_table :user_identities do |t|
      t.references :user, null: false
      t.string :provider, null: false
      t.string :uid,      null: false
    end

    add_index :user_identities, %i(user_id provider), unique: true
    add_index :user_identities, %i(provider uid), unique: true
  end
end
