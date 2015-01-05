require 'rails_helper'

RSpec.describe "Admin::Diplomados", :type => :request do
  describe "GET /admin_diplomados" do
    it "Diplomados" do
      get admin_diplomados_path
      expect(response).to have_http_status(200)
    end
  end

  subject {page}

  describe 'index' do
  	it "Deberia tener el contenido 'Diplomado'" do
      visit admin_diplomados_path
      expect(page).to have_content('Diplomado')
    end
  end

  describe 'show' do
  	let(:diplomado) {FactoryGirl.create(:diplomado)}
    before {visit admin_diplomado_path(diplomado)}

    it {should have_content(diplomado.nombre)}
  end

  describe 'new' do
  	before {visit admin_nuevo_diplomado_path}
  	let(:enviar) {'Guardar'}

  	describe 'con informacion invalida' do
  	  it 'no debe crear un diplomado' do
  	  	expect { click_button enviar}.not_to change(Diplomado, :count)
  	  end
  	end

  	describe 'con informacion valida' do
  	  before do
  	  	fill_in 'Nombre', with: 'Habilidades Directivas'
  	  	select 'Activo', :from => 'Estado'
  	  	fill_in 'Descripción', with: 'Este diplomado en habilidades directivas ....'
  	  	fill_in 'Objetivos', with: 'Objetivo 1| Objetivo 2| Objetivo 3| Objetivo 4'
  	  	fill_in 'Dirigido a', with: 'Profesionales| Bachilleres| Publico en General'
  	  	fill_in 'Créditos', with: 14
  	  	fill_in 'Horas Academicas', with: 100
  	  	fill_in 'Inversión', with: 400
  	  	fill_in 'Imagen', with: "bg4.jpg"
  	  end

  	  it 'deberia crear un diplomado' do
  	  	expect { click_button enviar}.to change(Diplomado, :count)
  	  end
  	end
  end

  describe 'edit' do
  	let(:diplomado) {FactoryGirl.create(:diplomado)}
  	before {visit edit_admin_diplomado_path(diplomado)}

  	describe 'Con informacion invalida' do
  	  before {
  	  	fill_in 'Nombre', with: ''
  	  	click_button 'Guardar'
  	  }

  	  it {should have_content('error')}
  	end

  	describe 'Con informacion valida' do
  	  let(:nuevo_nombre) { "Micro-Finanzas" }
  	  let(:nuevo_estado) { "I" }
  	  before {
  	  	fill_in 'Nombre', with: nuevo_nombre
  	  	select nuevo_estado, from: 'Estado'
  	  	click_button 'Guardar'
  	  }

  	  specify { expect(diplomado.reload.nombre).to eq nuevo_nombre }
  	  specify { expect(diplomado.reload.estado).to eq nuevo_estado }
  	end
  end
end