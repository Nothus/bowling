class Match < ActiveRecord::Base

  before_validation :start!

  validates_presence_of :started_at

  has_many :games

  def self.current_match
    Match.
      where(:ended_at => nil).
      first
  end

  def start!
    self.started_at = Time.now if started_at.blank?
  end

end
