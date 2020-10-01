class TravelLinesController < ApplicationController
  def index
    @travel_lines = TravelLine.all
  end
end
