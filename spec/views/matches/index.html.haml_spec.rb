require 'spec_helper'

describe 'matches/index' do
  context 'with nothing set' do
    before :each do
      @matches = []
    end
    it 'should render No Matches' do
      render
      rendered.should match /No Matches/
    end
  end
  context 'with matches' do
    before :each do
      @matches = [ mock_model('Match', :id => 'FakeID') ]
    end
    it 'should list the table headers' do
      render
      rendered.should match /Match ID/
      rendered.should match /Started At/
      rendered.should match /Ended At/
    end
    it 'should list the match ID' do
      render
      rendered.should match /FakeID/
    end
  end
end