require 'spec_helper'

describe Game do

  before :each do
    @game = FactoryGirl.create(:game)
  end

  describe '#display_roll(number)' do
    context 'with a non displayable roll' do
      it 'should return an empty string' do
        @game.stub(:displayable_roll?).and_return(false)
        @game.display_roll(1).should == ''
      end
    end
  end

  describe '#display_frame(number)' do
    context 'with a non displayable frame' do
      it 'should return an empty string' do
        @game.stub(:displayable_frame?).and_return(false)
        @game.display_frame(1).should == ''
      end
    end
    context 'with the first frame' do
      before :each do
        @frame = FactoryGirl.create(:frame, :game => @game, :number => 1)
      end
      context 'with two rolls' do
        it 'should return the score' do
          FactoryGirl.create(:roll, :frame => @frame, :pins => 6, :number => 1)
          FactoryGirl.create(:roll, :frame => @frame, :pins => 3, :number => 2)
          @game.display_frame(1).should == 9
        end
      end
    end
    context 'with many frames' do
      context 'and no strikes or spares' do
        it 'should return the total' do
          @frame1 = FactoryGirl.create(:frame, :game => @game, :number => 1)
          FactoryGirl.create(:roll, :frame => @frame1, :pins => 7)
          FactoryGirl.create(:roll, :frame => @frame1, :pins => 2)
          @frame2 = FactoryGirl.create(:frame, :game => @game, :number => 2)
          FactoryGirl.create(:roll, :frame => @frame2, :pins => 6)
          FactoryGirl.create(:roll, :frame => @frame2, :pins => 1)
          @game.display_frame(1).should == 9
          @game.display_frame(2).should == 16
        end
      end
      context 'and one spare' do
        it 'should return the total' do
          @frame1 = FactoryGirl.create(:frame, :game => @game, :number => 1)
          FactoryGirl.create(:roll, :frame => @frame1, :pins => 7)
          FactoryGirl.create(:roll, :frame => @frame1, :pins => 3)
          @frame2 = FactoryGirl.create(:frame, :game => @game, :number => 2)
          FactoryGirl.create(:roll, :frame => @frame2, :pins => 4)
          FactoryGirl.create(:roll, :frame => @frame2, :pins => 1)
          @game.display_frame(1).should == 14
          @game.display_frame(2).should == 19
        end
      end
    end
  end

  describe '#displayable_frame?(frame)' do
    context 'with frame being nil' do
      it 'should return false' do
        @game.displayable_frame?(nil).should == false
      end
    end
    context 'with a completed frame' do
      it 'should return true' do
        frame = FactoryGirl.create(:frame, :game => @game)
        FactoryGirl.create(:roll, :frame => frame, :pins => 6)
        FactoryGirl.create(:roll, :frame => frame, :pins => 1)
        @game.displayable_frame?(frame).should == true
      end
    end
  end

  describe '#roll_from_number(number)' do
    it 'should return the roll' do
      @frame = FactoryGirl.create(:frame, :game => @game, :number => 1)
      roll = FactoryGirl.create(:roll, :frame => @frame, :pins => 7)
      @game.roll_from_number(1).should == roll
    end
    it 'should return the second roll' do
      @frame = FactoryGirl.create(:frame, :game => @game, :number => 1)
      FactoryGirl.create(:roll, :frame => @frame, :pins => 7)
      roll = FactoryGirl.create(:roll, :frame => @frame, :pins => 3)
      @game.roll_from_number(2).should == roll
    end
  end

end