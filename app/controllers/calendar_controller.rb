class CalendarController < ApplicationController
  def index
    @matches = Match.all
  end

  def create

    p convert_to_date(params[:start_date])
    # @article = Article.new(article_params)

    # if @article.save
    #   redirect_to @article
    # else
    #   render 'new'
    # end
  end

  private
    def convert_to_date(string)
      if string == "January"

      end
    end
end
