require 'rails_helper'

RSpec.describe AreaDiplomado, :type => :model do
  let(:area) { FactoryGirl.create(:area) }
  let(:diplomado) { FactoryGirl.create(:diplomado) }

  #let(:area_diplomado) { area.area_diplomados.build(diplomado: diplomado.id) }
  before {
  	@area_diplomado = AreaDiplomado.new(estado: "A", diplomado_id: diplomado.id, area_id: area.id)
  }

  subject { @area_diplomado }

  it { should be_valid }

  it {should respond_to(:id)}
  it {should respond_to(:estado)}
  it {should respond_to(:area_id)}
  it {should respond_to(:area)}
  it {should respond_to(:diplomado_id)}
  it {should respond_to(:diplomado)}

  it {should be_valid}

  describe 'Cuando el area_id no esta presente' do
  	before { @area_diplomado.area_id = nil}
  	it {should_not be_valid}
  end

  describe 'Cuando el diplomado_id no esta presente' do
  	before { @area_diplomado.diplomado_id = nil}
  	it {should_not be_valid}
  end

  describe 'Cuando el estado no esta presente' do
  	before { @area_diplomado.estado = ""}
  	it {should_not be_valid}
  end

end
