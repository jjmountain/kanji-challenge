class Api::V1::KanjiCardsController < Api::V1::BaseController
  def index
    @kanji_cards = policy_scope(KanjiCard)
  end
end