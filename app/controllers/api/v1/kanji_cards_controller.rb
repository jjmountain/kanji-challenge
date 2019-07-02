class Api::V1::KanjiCardsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_card, only: [ :show, :update, :destroy ]
  def index
    @kanji_cards = policy_scope(KanjiCard)
  end

  def show
  end

  def update
    if @card.update(card_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @card.destroy
    head :no_content
  end

  private

  def set_card
    @card = KanjiCard.find(params[:id])
    authorize @card
  end

  def card_params
    params.require(:kanji_card).permit(:easiness_factor, :interval, :repetition)
  end

  def render_error
    render json: { errors: @card.errors.full_messages },
      status: :unprocessable_entity
    end
end
