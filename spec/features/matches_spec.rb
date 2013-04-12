require 'spec_helper'

describe '/matches' do

  describe 'GET /matches' do

    describe 'New Match Form' do
      it 'should ask to start a new game' do
        visit '/matches'
        page.should have_button 'Start'
      end
      it 'should redirect to the current match' do
        visit '/matches'
        within('#new-match') do
          fill_in 'player1', :with => 'Lilu'
          fill_in 'player2', :with => 'Corban'
        end
        click_button 'Start'
        page.should have_content 'Lilu'
        page.should have_content 'Corban'
      end
    end

    it 'should list the current matches' do
      matches = 2.times.collect{ FactoryGirl.create(:match_ended) }

      visit '/matches'
      matches.each do |match|
        page.should have_content match.id
      end
    end

  end
end