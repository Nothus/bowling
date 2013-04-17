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
    end

    create_table :frames do |t|
      t.integer :game_id
      t.integer :number
    end

    create_table :rolls do |t|
      t.integer :frame_id
      t.integer :pins
      t.integer :number
      t.boolean :is_foul, :default => false
      t.boolean :is_split, :default => false

      t.timestamps
    end
  end
end
