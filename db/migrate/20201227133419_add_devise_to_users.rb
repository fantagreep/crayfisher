# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
