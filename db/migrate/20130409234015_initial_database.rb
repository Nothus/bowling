class InitialDatabase < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :started_at, :default => nil
      t.datetime :ended_at,   :default => nil
    end
  end
end
