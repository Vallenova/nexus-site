require 'rails_helper'

RSpec.describe Coleccion, :type => :model do
  before { @coleccion = FactoryGirl.create(:coleccion) }

  subject { @coleccion }

  it {should respond_to(:descripcion)}
  it {should respond_to(:estado)}
  it {should respond_to(:picture)}
  it {should respond_to(:url)}

  it {should be_valid}

  describe "Cuando la descripcion no esta presente" do
  	before { @coleccion.descripcion= " "}
  	it {should_not be_valid}
  end

  describe "Cuando el estado no esta presente" do
  	before { @coleccion.estado= " "}
  	it {should_not be_valid}
  end

  describe "Cuando picture no esta presente" do
    before { @coleccion.picture= " "}
    it {should_not be_valid}
  end

  describe "Cuando la url no esta presente" do
    before { @coleccion.url= " "}
    it {should_not be_valid}
  end
end
