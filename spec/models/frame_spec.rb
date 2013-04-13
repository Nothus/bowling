require 'spec_helper'

describe Frame do

  describe '#first_roll' do
    it 'should return the first roll of the frame' do
      frame = FactoryGirl.create(:frame, :number => 1)
      roll = FactoryGirl.create(:roll, :frame => frame, :number => 1, :pins => 5)
      frame.first_roll.should == roll
    end
  end

  describe '#second_roll' do
    it 'should return the second roll of the frame' do
      frame = FactoryGirl.create(:frame, :number => 1)
      roll = FactoryGirl.create(:roll, :frame => frame, :number => 2, :pins => 5)
      frame.second_roll.should == roll
    end
  end

  describe '#third_roll' do
    it 'should return the third roll of the frame' do
      frame = FactoryGirl.create(:frame, :number => 1)
      roll = FactoryGirl.create(:roll, :frame => frame, :number => 3, :pins => 5)
      frame.third_roll.should == roll
    end
  end

  describe '#number!' do
    it 'should number the frame with no previous rolls' do
      game = FactoryGirl.create(:game)
      frame = FactoryGirl.build(:frame, :game => game)
      frame.number.should == nil
      frame.send(:number!)
      frame.number.should == 1
    end
    it 'should not the roll if it has been previously numbered' do
      frame = FactoryGirl.build(:frame, :number => 20)
      frame.send(:number!)
      frame.number.should == 20
    end
  end

  describe '#score' do
    it 'should return the score' do
      frame = FactoryGirl.create(:frame, :number => 1)
      FactoryGirl.create(:roll, :frame => frame, :pins => 2)
      FactoryGirl.create(:roll, :frame => frame, :pins => 4)
      frame.score.should == 6
    end
  end

end