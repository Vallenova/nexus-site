require 'rails_helper'

RSpec.describe Evento, :type => :model do
  before { @evento = FactoryGirl.create(:evento) }

  subject { @evento }

  it {should respond_to(:fecha_inicio)}
  it {should respond_to(:fecha_fin)}
  it {should respond_to(:modalidad)}
  it {should respond_to(:inversion)}
  it {should respond_to(:estado)}
  it {should respond_to(:diplomado_id)}

  it {should be_valid}

  describe 'Cuando la fecha de inicio no esta presente' do
  	before { @evento.fecha_inicio = ''}
  	it {should_not be_valid}
  end

  describe 'Cuando la fecha fin no esta presente' do
  	before { @evento.fecha_fin= ''}
  	it {should_not be_valid}
  end

  describe 'Cuando la fecha fin no esta presente' do
  	before { @evento.modalidad= ''}
  	it {should_not be_valid}
  end

  describe 'Cuando la fecha fin no esta presente' do
  	before { @evento.inversion= ''}
  	it {should_not be_valid}
  end

  describe 'Cuando el estado no esta presente' do
  	before { @evento.estado= ''}
  	it {should_not be_valid}
  end

end
