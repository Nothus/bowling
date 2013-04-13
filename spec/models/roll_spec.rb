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

end