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
    it 'should return the score just for the frame' do
      frame = FactoryGirl.create(:frame, :number => 1)
      FactoryGirl.create(:roll, :frame => frame, :pins => 2)
      FactoryGirl.create(:roll, :frame => frame, :pins => 4)
      frame.score.should == 6
    end
    it 'should return the score and the next roll' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame1, :pins => 7)
      FactoryGirl.create(:roll, :frame => frame1, :pins => 3)
      frame2 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 2)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 4)
      frame1.score.should == 12
    end
    it 'should return the score and the next two rolls' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame1, :pins => 10)
      frame2 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 2)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 3)
      frame3 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame3, :pins => 4)
      FactoryGirl.create(:roll, :frame => frame3, :pins => 1)
      frame1.score.should == 15
    end
  end

  describe '#next_frame' do
    it 'should return the next frame' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      frame2 = FactoryGirl.create(:frame, :game => game)
      frame1.next_frame.should == frame2
    end
  end

  describe '#next_roll' do
    it 'should return the next roll' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      frame2 = FactoryGirl.create(:frame, :game => game)
      roll = FactoryGirl.create(:roll, :frame => frame2, :pins => 2)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 3)
      frame1.next_roll.should == roll
    end
  end

  describe '#next_roll' do
    it 'should return the next next roll of the frame' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      frame2 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 2)
      roll = FactoryGirl.create(:roll, :frame => frame2, :pins => 3)
      frame1.next_next_roll.should == roll
    end
    it 'should return the next next roll of the next frame' do
      game = FactoryGirl.create(:game)
      frame1 = FactoryGirl.create(:frame, :game => game)
      frame2 = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame2, :pins => 10)
      frame3 = FactoryGirl.create(:frame, :game => game)
      roll = FactoryGirl.create(:roll, :frame => frame3, :pins => 4)
      frame1.next_next_roll.should == roll
    end
  end

  describe '#strike?' do
    it 'should return true' do
      game = FactoryGirl.create(:game)
      frame = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame, :pins => 10)
      frame.strike?.should be_true
    end
    it 'should return false' do
      game = FactoryGirl.create(:game)
      frame = FactoryGirl.create(:frame, :game => game)
      FactoryGirl.create(:roll, :frame => frame, :pins => 7)
      frame.strike?.should be_false
    end
  end

end