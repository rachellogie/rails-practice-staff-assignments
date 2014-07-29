require 'rails_helper'

describe Assignment do

  it 'must have a role' do
    assignment = Assignment.new(role: "manager", location_id:"1")
    expect(assignment).to be_valid

    assignment.role = ""
    expect(assignment).to_not be_valid
  end

end