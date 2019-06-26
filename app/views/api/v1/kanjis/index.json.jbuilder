json.array! @kanji do |kanji|
  json.extract! kanji, :id, :character, :onyomi, :kunyomi, :components, :english, :examples, :rtk
end