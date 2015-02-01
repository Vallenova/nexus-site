require 'rails_helper'

RSpec.describe "Admin::Area_diplomados", :type => :request do
  describe "GET /admin_area_diplomados" do
    it "Area_diplomados" do
      get admin_area_diplomados_path
      expect(response).to have_http_status(200)
    end
  end

   subject {page}

  describe 'index' do
   	it "Deberia tener el contenido Asignación" do
   	  visit admin_area_diplomados_path
   	  expect(page).to have_content('Asignación')
   	end
  end

  describe 'show' do
  	let(:area_diplomado) {FactoryGirl.create(:area_diplomado)}
  	before {visit admin_area_diplomado_path(area_diplomado)}

  	it {should have_content(area_diplomado.area.nombre)}
  end

  describe 'new' do

    let!(:area) {FactoryGirl.create(:area)}
    let!(:diplomado) {FactoryGirl.create(:diplomado)}
    
  	before {visit admin_nueva_area_diplomado_path}
  	let(:enviar) {'Guardar'}

  	describe 'con informacion invalida' do

  	  it 'no debe realizar asignación' do
  	  	expect {click_button enviar}.not_to change(AreaDiplomado, :count)
  	  end
  	end

  	describe 'con informacion valida' do
      
      before do
        select 'Administración', :from => 'Área'
        select 'Habilidades Directivas', :from => 'Diplomado'
        select 'Activo', :from => 'Estado'
      end

      it 'debe realizar asignación' do
        expect {click_button enviar}.to change(AreaDiplomado, :count)
      end
    end
  end

  describe 'edit' do
    let!(:area_diplomado) {FactoryGirl.create(:area_diplomado)}

    before {visit edit_admin_area_diplomado_path(area_diplomado)}

    describe 'Con informacion valida' do
      let(:nuevo_estado) { "I" }
      before {
        select nuevo_estado, from: 'Estado'
        click_button 'Guardar'
      }

      specify { expect(area_diplomado.reload.estado).to eq nuevo_estado }
    end
  end
end
