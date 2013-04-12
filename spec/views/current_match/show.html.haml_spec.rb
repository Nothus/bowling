require 'spec_helper'

describe 'current_match/show' do
  context 'with no current match' do
    it 'should say No Current Match' do
      render
      rendered.should match 'No Current Match'
    end
  end
end