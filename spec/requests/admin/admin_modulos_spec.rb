require 'rails_helper'

RSpec.describe "Admin::Modulos", :type => :request do
  describe "GET /admin_modulos" do
    it "Modulos" do
      get admin_modulos_path
      expect(response).to have_http_status(200)
    end
  end

  subject {page}

  describe 'index' do
  	it "Deberia tener el contenido Módulo" do
  	  visit admin_modulos_path
  	  expect(page).to have_content('Módulo')
  	end
  end

  describe 'show' do
  	let(:modulo) {FactoryGirl.create(:modulo)}
  	before {visit admin_modulo_path(modulo)}

  	it {should have_content(modulo.nombre)}
  end

  describe 'new' do
    let!(:diplomado) {FactoryGirl.create(:diplomado)}
    
  	before {visit admin_nuevo_modulo_path}
  	let(:enviar) {'Guardar'}

  	describe 'con informacion invalida' do
  	  it 'no debe crar un modulo' do
  	  	expect {click_button enviar}.not_to change(Modulo, :count)
  	  end
  	end

  	describe 'con informacion valida' do
      
      before do
        select 'Habilidades Directivas', :from => 'Diplomado'
        fill_in 'Nombre', with: 'Modulo 1'
        select 'Activo', :from => 'Estado'
      end

      it 'deberia crear un modulo' do
        expect {click_button enviar}.to change(Modulo, :count)
      end
    end
  end

  describe 'edit' do
    let!(:modulo) {FactoryGirl.create(:modulo)}

    before {visit edit_admin_modulo_path(modulo)}

    describe 'Con informacion invalida' do
      before {
        fill_in 'Nombre', with: ''
        click_button 'Guardar'
      }

      it {should have_content('error')}
    end

    describe 'Con informacion valida' do
      let(:nuevo_nombre) { "Modulo 2" }
      let(:nuevo_estado) { "I" }
      before {
        fill_in 'Nombre', with: nuevo_nombre
        select nuevo_estado, from: 'Estado'
        click_button 'Guardar'
      }

      specify { expect(modulo.reload.nombre).to eq nuevo_nombre }
      specify { expect(modulo.reload.estado).to eq nuevo_estado }
    end
  end
end
