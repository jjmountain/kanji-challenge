class Api::V1::KanjisController < Api::V1::BaseController
  def index
    @kanji = policy_scope(Kanji)
  end
end