class AddSummaryToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :summary, :text
  end
end
