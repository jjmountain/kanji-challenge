class Api::V1::CoreWordsController < Api::V1::BaseController
  def index
    @core_words = policy_scope(CoreWord)
  end
end