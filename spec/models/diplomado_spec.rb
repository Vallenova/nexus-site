require 'rails_helper'

RSpec.describe Diplomado, :type => :model do
  before { @diplomado = FactoryGirl.create(:diplomado)}

  subject { @diplomado }

  it {should respond_to(:nombre)}
  it {should respond_to(:estado)}
  it {should respond_to(:descripcion)}
  it {should respond_to(:objetivos)}
  it {should respond_to(:dirigido)}
  it {should respond_to(:creditos)}
  it {should respond_to(:horas_acad)}
  it {should respond_to(:inversion)}
  it {should respond_to(:picture)}

  it {should be_valid}

  describe 'Cuando el nombre no esta presente' do
  	before { @diplomado.nombre= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando el estado no esta presente' do
  	before { @diplomado.estado= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando la descripcion no esta presente' do
  	before { @diplomado.descripcion= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando los objetivos no estan presente' do
  	before { @diplomado.objetivos= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando dirigido no esta presente' do
  	before { @diplomado.dirigido= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando creditos no esta presente' do
  	before { @diplomado.creditos= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando horas_acad no esta presente' do
  	before { @diplomado.horas_acad= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando inversion no esta presente' do
  	before { @diplomado.inversion= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando picture no esta presente' do
  	before { @diplomado.picture= " "}
  	it {should_not be_valid}
  end

end
