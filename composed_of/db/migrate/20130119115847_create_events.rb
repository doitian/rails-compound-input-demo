class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :beginning_time

      t.timestamps
    end
  end
end
