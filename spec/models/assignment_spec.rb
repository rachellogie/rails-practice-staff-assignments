require 'rails_helper'

describe Assignment do

  before do
    @assignment = Assignment.create(role: "manager", location_id:"1")
    expect(@assignment).to be_valid
  end

  it 'must have a role' do
    @assignment.role = ""
    expect(@assignment).to_not be_valid
  end

  it 'cannot assign the same role/location pair to a person twice' do
    person = create_person(first_name: 'Meatball')
    assignment1 = person.assignments.create(role: "manager", location_id:"2")
    expect(assignment1).to be_valid
    assignment2 = person.assignments.create(role: "manager", location_id:"2")
    expect(assignment2).to_not be_valid

    person2 = create_person(first_name: 'Doodle')
    assignment3 = person2.assignments.create(role: "manager", location_id:"2")
    expect(assignment3).to be_valid
  end

end