class CreateCategoryLogs < ActiveRecord::Migration
  def change
    create_table :category_logs do |t|
      t.integer :log_id
      t.integer :category_id
      t.integer :score

      t.timestamps
    end
  end
end
