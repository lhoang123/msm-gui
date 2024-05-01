class MoviesController < ApplicationController
  def create
   
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
 
    m.save 
 
    redirect_to("/movies")
   end 

   def destroy
    the_id = params.fetch("path_id")
    movie_record = Movie.where({ :id => the_id })
    movie = movie_record.at(0)
  
    movie.destroy
  
    redirect_to("/movies")
  end

  def modify
    the_id = params.fetch("path_id")
    movie_record = Movie.where({ :id => the_id })
    movie = movie_record.at(0)

    movie.title = params.fetch("new_title")
    movie.year = params.fetch("new_year")
    movie.duration = params.fetch("new_duration")
    movie.description = params.fetch("new_description")
    movie.image = params.fetch("new_image")
    movie.director_id = params.fetch("new_director_id")

    movie.save
  
    redirect_to("/movies/#{movie.id}")

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
