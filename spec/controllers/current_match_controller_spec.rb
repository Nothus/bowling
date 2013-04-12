require 'spec_helper'

describe CurrentMatchController do

  describe 'GET #show' do
    it 'should assign @current_match to nil' do
      get :show
      assigns[:current_match].should == nil
    end
    it 'should assign @current_match to the current match' do
      current_match = mock_model('Match')
      Match.stub(:current_match).and_return(current_match)
      get :show
      assigns[:current_match].should == current_match
    end
    it 'should render the template' do
      get :show
      response.should render_template 'show'
    end
  end

end