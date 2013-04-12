class InitialDatabase < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :started_at, :null => false
      t.datetime :ended_at,   :default => nil
    end

    create_table :games do |t|
      t.integer :match_id

      t.string :player
      t.integer :next_game_id

      t.integer :frame1_1, :default => nil
      t.integer :frame1_2, :default => nil

      t.integer :frame2_1, :default => nil
      t.integer :frame2_2, :default => nil

      t.integer :frame3_1, :default => nil
      t.integer :frame3_2, :default => nil

      t.integer :frame4_1, :default => nil
      t.integer :frame4_2, :default => nil

      t.integer :frame5_1, :default => nil
      t.integer :frame5_2, :default => nil

      t.integer :frame6_1, :default => nil
      t.integer :frame6_2, :default => nil

      t.integer :frame7_1, :default => nil
      t.integer :frame7_2, :default => nil

      t.integer :frame8_1, :default => nil
      t.integer :frame8_2, :default => nil

      t.integer :frame9_1, :default => nil
      t.integer :frame9_2, :default => nil

      t.integer :frame10_1, :default => nil
      t.integer :frame10_2, :default => nil
      t.integer :frame10_3, :default => nil
    end
  end
end
