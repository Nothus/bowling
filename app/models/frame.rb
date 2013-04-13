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
    rolls.reduce(0) { |sum, roll| sum + roll.pins }
  end

  private

  def number!
    self.number = game(true).frames.size + 1 if number.blank?
  end

end