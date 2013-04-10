require 'spec_helper'

describe '/matches' do

  it 'should ask to start a new game' do
    visit '/matches'
    page.should have_content 'Start'
  end

  it 'should list the current matches' do
    matches = 2.times.collect{ FactoryGirl.create(:match_ended) }

    visit '/matches'
    matches.each do |match|
      page.should have_content match.id
    end
  end

  describe '/new' do
  end

end