require 'spec_helper'

describe 'Routes' do

  context '/matches' do
    it 'should route matches#index' do
      expect(:get => '/matches').
        to route_to(
             :controller => 'matches',
             :action     => 'index'
           )
    end
  end

end