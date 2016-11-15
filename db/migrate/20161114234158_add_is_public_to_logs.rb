class AddIsPublicToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :public, :boolean
  end
end
