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
        matches = 2.times.collect{ FactoryGirl.create(:match)}
        get :index
        assigns[:matches].should == matches
      end
    end
    it 'should render the template' do
      get :index
      response.should render_template 'matches'
    end
  end

end