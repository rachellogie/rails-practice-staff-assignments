require 'rails_helper'

describe Person do

  before :each do
    @person = Person.create(title: 'mr', first_name: 'aubrey', last_name:'howell')
    expect(@person).to be_valid
  end

  it 'validates presence of last name' do
    @person.last_name = ""
    expect(@person).to_not be_valid
  end

  it 'validates presence of title if first name is blank' do
    @person.first_name = ""
    expect(@person).to be_valid

    @person.title = ""
    expect(@person).to_not be_valid
  end

  it 'validates presence of first name if title is blank' do
    @person.title = ""
    expect(@person).to be_valid

    @person.first_name = ""
    expect(@person).to_not be_valid
  end
end