class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :interval
      t.boolean :active
      t.integer :site_id

      t.timestamps
    end
  end
end
