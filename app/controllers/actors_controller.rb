class ActorsController < ApplicationController
  def create
   
    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
 
    a.save 
 
    redirect_to("/actors")
   end 
  
  def modify
   
    the_id = params[:path_id]

    actor = Actor.find_by(id: the_id) 

    actor.name = params.fetch("new_name")
    actor.dob = params.fetch("new_dob")
    actor.bio = params.fetch("new_bio")
    actor.image = params.fetch("new_image")

    actor.save
  
    redirect_to("/actors/:path_id")  
   
  end 

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
