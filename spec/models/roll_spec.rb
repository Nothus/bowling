require 'spec_helper'

describe Roll do
  describe '#number!' do
    before :each do
      @frame = FactoryGirl.create(:frame, :game => FactoryGirl.create(:game))
    end
    it 'should number the roll with no previous rolls' do
      roll = FactoryGirl.build(:roll, :frame => @frame)
      roll.number.should == nil
      roll.send(:number!)
      roll.number.should == 1
    end
    it 'should not the roll if it has been previously numbered' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :number => 20)
      roll.send(:number!)
      roll.number.should == 20
    end
    it 'should number the roll with previous rolls' do
      FactoryGirl.create(:roll, :frame => @frame, :pins => 2)
      roll = FactoryGirl.build(:roll, :frame => @frame)
      roll.number.should == nil
      roll.send(:number!)
      roll.number.should == 2
    end
  end

  describe '#to_s' do
    before :each do
      @frame = FactoryGirl.create(:frame, :game => FactoryGirl.create(:game))
    end
    it 'should display the number of pins knocked down' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :pins => 7)
      roll.to_s.should == '7'
    end
    it 'should display an X' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :pins => 10)
      roll.to_s.should == 'X'
    end
    it 'should display a /' do
      FactoryGirl.create(:roll, :frame => @frame, :pins => 6)
      roll = FactoryGirl.create(:roll, :frame => @frame, :pins => 4)
      roll.to_s.should == '/'
    end
    it 'should display a -' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :pins => 0)
      roll.to_s.should == '-'
    end
    it 'should display an F' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :pins => 0, :is_foul => true)
      roll.to_s.should == 'F'
    end
    it 'should display an S' do
      roll = FactoryGirl.build(:roll, :frame => @frame, :pins => 4, :is_split => true)
      roll.to_s.should == 'S 4'
    end
  end

end