class MoviesController < ApplicationController
  def index
    if params[:q].present?
      ## WITH PGSEARCH
      @movies = Movie.search_by_title_synopsis_and_director(params[:q])

      ## WITH SQL 
      # sql_query = <<~SQL
      # title @@ :q OR
      # synopsis @@ :q OR
      # directors.first_name @@ :q OR
      # directors.last_name @@ :q
      # SQL

      # @movies = Movie.joins(:director).where(sql_query, q: "%#{params[:q]}%")
    # end
    # if params[:location].present?
    #   @movies = @movies.near(params[:location], params[:radius])


    else
      @movies = Movie.all
    end
  end
end
