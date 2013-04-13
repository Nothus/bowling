require 'spec_helper'

describe Game do

  describe '#display_roll(roll)' do
    it 'should return an empty string if they have not rolled it yet' do
      game = FactoryGirl.create(:game)
      game.display_roll(1).should == ''
    end
  end

  describe '#display_frame(frame)' do
    it 'should return an empty string if there are no rolls for the frame' do
      game = FactoryGirl.create(:game)
      game.display_frame(1).should == ''
    end
  end

end