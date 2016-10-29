class RoundsController < ApplicationController
  include RoundsHelper

  def index
    create_bracket
    @rounds = Round.all
  end
end
