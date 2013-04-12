class Game < ActiveRecord::Base
  attr_accessible :player

  belongs_to :match
end