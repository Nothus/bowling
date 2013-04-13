require 'spec_helper'

describe 'matches/show' do

  before :each do
    @match = FactoryGirl.create(:match_started)
    FactoryGirl.create(:game, :match => @match, :player => 'Player 1')
    FactoryGirl.create(:game, :match => @match, :player => 'Player 2')
  end

end