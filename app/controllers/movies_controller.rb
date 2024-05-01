class MoviesController < ApplicationController
  def create
   
    d = Movie.new
    d.title = params.fetch("the_title")
    d.year = params.fetch("the_year")
    d.duration = params.fetch("the_duration")
    d.description = params.fetch("the_description")
    d.image = params.fetch("the_image")
    d.director_id = params.fetch("the_director_id")
 
    d.save 
 
    redirect_to("/movies")
   end 

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

end
