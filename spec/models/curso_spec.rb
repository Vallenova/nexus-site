require 'rails_helper'

RSpec.describe Curso, :type => :model do
  let(:modulo) {FactoryGirl.create(:modulo)}
  before {
  	@curso = Curso.new(nombre: "Curso 1", estado: "A", modulo_id: modulo.id)
  }

  subject { @curso}

  it {should respond_to(:id)}
  it {should respond_to(:nombre)}
  it {should respond_to(:estado)}
  it {should respond_to(:modulo_id)}
  it {should respond_to(:modulo)}

  it {should be_valid}

  describe 'Cuando el modulo_id no esta presente' do
  	before { @curso.modulo_id = nil}
  	it {should_not be_valid}
  end

  describe 'Cuando el nombre no esta presente' do
  	before { @curso.nombre = ""}
  	it {should_not be_valid}
  end

  describe 'Cuando el estado no esta presente' do
  	before { @curso.estado = ""}
  	it {should_not be_valid}
  end
end
