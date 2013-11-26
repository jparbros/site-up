class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.boolean :success
      t.integer :response_time
      t.integer :site_id

      t.timestamps
    end
  end
end
