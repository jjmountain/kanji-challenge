class KanjiCard < ApplicationRecord
  belongs_to :user
  belongs_to :kanji
  validates :kanji_id, uniqueness: true


  MAX_GRADE = 5
    # 0 = really hard to answer / 5 = really easy to answer
    # D_EF[q] = (0.1 - (MAX_GRADE - grade) * (0.08 + (MAX_GRADE - grade) * 0.02))
    D_EF = {
      5 => 0.1,
      4 =>  0,
      3 => -0.14,
      2 => -0.32,
      1 => -0.54,
      0 => -0.8
    }.freeze

  def next_interval(grade)
    grade = MAX_GRADE if grade > MAX_GRADE

    if grade >= 3
      if self.repetition == 0
        self.interval = 1
        self.repetition = 1
      elsif repetition == 1
        self.interval = 6
        self.repetition = 2
      else
        self.interval = (interval * easiness_factor).round
        self.repetition = repetition + 1
      end
    else
      self.repetition = 0
      self.interval = 1
    end

    self.easiness_factor = (easiness_factor + D_EF[grade]).round(2)
    self.easiness_factor = easiness_factor < 1.3 ? 1.3 : easiness_factor

    return interval
  end
end
