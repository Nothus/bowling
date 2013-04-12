require 'spec_helper'

describe MatchesController do

  describe 'GET #index' do
    context 'with no matches' do
      it 'should assign [] to @matches' do
        get :index
        assigns[:matches].should == []
      end
    end
    context 'with matches' do
      it 'should assign the matches to @matches' do
        matches = 2.times.collect{ mock_model('Match') }
        Match.stub(:all).and_return(matches)
        get :index
        assigns[:matches].should == matches
      end
    end
    it 'should render the template' do
      get :index
      response.should render_template 'index'
    end
  end

  describe 'POST #create' do
    before :each do
      @params = { :player => ['Player 1', 'Player 2'] }
    end
    it 'should create a match' do
      Match.current_match.should be_nil
      post :create, @params
      Match.current_match.should_not be_nil
    end
    it 'should start the match' do
      post :create, @params
      Match.current_match.started_at.to_i.should be_within(1).of(Time.now.to_i)
    end
    it 'should create a game for each player' do
      post :create, @params
      games = Match.current_match.games
      games.size.should == 2
      games[0].player.should == 'Player 1'
      games[1].player.should == 'Player 2'
    end
    it 'should redirect' do
      post :create, @params
      match = assigns[:match]
      response.should redirect_to "/matches/#{match.id}"
    end
  end

  describe 'GET #show' do
    before :each do
      @match = FactoryGirl.create(:match)
    end
    it 'should assign the match' do
      get :show, {:id => @match.id}
      assigns[:match].should == @match
    end
    it 'should render the template' do
      get :show, {:id => @match.id}
      response.should render_template 'show'
    end
  end
end