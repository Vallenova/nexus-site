require 'rails_helper'

RSpec.describe Modulo, :type => :model do
  let(:diplomado) {FactoryGirl.create(:diplomado)}
  before {
  	@modulo = Modulo.new(nombre: "Modulo 1", estado: "A", diplomado_id: diplomado.id)
  }

  subject { @modulo }

  it {should respond_to(:id)}
  it {should respond_to(:nombre)}
  it {should respond_to(:estado)}
  it {should respond_to(:diplomado_id)}
  it {should respond_to(:diplomado)}
  it {should respond_to(:cursos)}

  it {should be_valid}

  describe 'Cuando el diplomado_id no esta presente' do
  	before { @modulo.diplomado_id = nil}
  	it {should_not be_valid}
  end

  describe 'Cuando el nombre no esta presente' do
  	before { @modulo.nombre= " "}
  	it {should_not be_valid}
  end

  describe 'Cuando el estado no esta presente' do
  	before { @modulo.estado= " "}
  	it {should_not be_valid}
  end

end
