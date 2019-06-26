json.array! @kanji_cards do |card|
  json.extract! card, :id, :easiness_factor, :repetition, :interval, :user_id, :kanji_id
end