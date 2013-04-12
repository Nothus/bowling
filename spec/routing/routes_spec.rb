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
    it 'should route to matches#show' do
      expect(:get => '/matches/23').
        to route_to(
             :controller => 'matches',
             :action     => 'show',
             :id         => '23'
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