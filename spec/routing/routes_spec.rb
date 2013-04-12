require 'spec_helper'

describe 'Routes' do

  context '/matches' do
    it 'should route to matches#index' do
      expect(:get => '/matches').
        to route_to(
             :controller => 'matches',
             :action     => 'index'
           )
    end
    it 'should route to matches#create' do
      expect(:post => '/matches').
        to route_to(
             :controller => 'matches',
             :action     => 'create'
           )
    end
  end

  context '/current_match' do
    it 'should route to current_match#show' do
      expect(:get => '/current_match').
      to route_to(
           :controller => 'current_match',
           :action     => 'show'
         )
    end
  end

end