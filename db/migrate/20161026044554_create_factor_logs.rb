class CreateFactorLogs < ActiveRecord::Migration
  def change
    create_table :factor_logs do |t|
      t.integer :log_id
      t.integer :factor_id
      t.integer :score

      t.timestamps
    end
  end
end
