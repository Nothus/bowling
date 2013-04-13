class Frame < ActiveRecord::Base

  belongs_to :game

  has_many :rolls

  before_validation :number!

  validates_presence_of :number

  def first_roll
    rolls.where(:number => 1).first
  end

  def second_roll
    rolls.where(:number => 2).first
  end

  def third_roll
    rolls.where(:number => 3).first
  end

  def score
    if strike?
      10 + next_roll.pins + next_next_roll.pins
    elsif first_roll.pins + second_roll.pins == 10
      10 + next_roll.pins
    else
      rolls.reduce(0) { |sum, roll| sum + roll.pins }
    end
  end

  def next_frame
    game.frames.where(:number => number + 1).first
  end

  def next_roll
    next_frame.first_roll
  end

  def next_next_roll
    if next_frame.strike?
      next_frame.next_roll
    else
      next_frame.second_roll
    end
  end

  def strike?
    first_roll.pins == 10
  end

  private

  def number!
    self.number = game(true).frames.size + 1 if number.blank?
  end

end