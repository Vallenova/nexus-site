require 'rails_helper'

RSpec.describe Area, :type => :model do

  before { @area = FactoryGirl.create(:area) }

  subject { @area }

  it {should respond_to(:nombre)}
  it {should respond_to(:estado)}
  it {should respond_to(:picture)}

  it {should be_valid}

  describe "Cuando el nombre no esta presente" do
  	before { @area.nombre= " "}
  	it {should_not be_valid}
  end

  describe "Cuando el estado no esta presente" do
  	before { @area.estado= " "}
  	it {should_not be_valid}
  end

  describe "Cuando picture no esta presente" do
    before { @area.picture= " "}
    it {should_not be_valid}
  end

end
