require 'spec_helper'

describe Match do

  describe '.current_match()' do
    context 'with no matches' do
      it 'should return nil' do
        described_class.current_match.should == nil
      end
    end
    context 'with only ended matches' do
      it 'should return nil' do
        FactoryGirl.create(:match_ended)
        described_class.current_match.should == nil
      end
    end
    context 'with an open match' do
      it 'should return the current_match' do
        current_match = FactoryGirl.create(:match_started)
        described_class.current_match.should == current_match
      end
    end
  end

  describe '#start!' do
    it 'should set started_at' do
      match = FactoryGirl.build(:match)
      match.started_at.should be_nil
      match.send(:start!)
      match.started_at.should_not be_nil
    end
  end

end
