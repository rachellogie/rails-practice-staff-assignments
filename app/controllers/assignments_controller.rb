class AssignmentsController < ApplicationController

  def new
    @person = Person.find(params[:person_id])
    @locations = Location.all
    @assignment = Assignment.new
  end

  def create
    person = Person.find(params[:person_id])
    assignment = person.assignments.new(assignment_params)
    assignment.location_id = params[:location][:place]
    assignment.role = params[:assignment][:role]
    if assignment.save
      redirect_to person_path(person)
    else
      render :new
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:person_id)
  end
end