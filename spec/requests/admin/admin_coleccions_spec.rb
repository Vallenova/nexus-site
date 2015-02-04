require 'rails_helper'

RSpec.describe "Admin::Coleccions", :type => :request do
  subject {page}

  let(:usuario) { FactoryGirl.create(:usuario) }

  before {
    visit admin_coleccions_path
    fill_in "Email",    with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
  }

  describe "index" do

    it "Deberia tener el contenido 'Descripción'" do
      visit admin_coleccions_path
      expect(page).to have_content('Descripción')
    end
  end

  describe "show" do

    let(:coleccion) {FactoryGirl.create(:coleccion)}
    before {visit admin_coleccion_path(coleccion)}

    it {should have_content(coleccion.descripcion)}
  end

  describe "new" do
    before {visit admin_nueva_coleccion_path}
    let(:enviar) {"Guardar"}

    describe "con informacion invalida" do
      it "no debe crear un area" do
        expect { click_button enviar }.not_to change(Coleccion, :count)
      end
    end


    describe "con informacion valida" do
      before do
        fill_in "Descripción", with: "Ingenieria"
        fill_in "URL", with: "Ingenieria"
        select 'Activo', :from => 'Estado'
        fill_in "Imagen", with: "bg4.jpg"
      end

      it "deberia crear un item" do
        expect { click_button enviar }.to change(Coleccion, :count)
      end

    end
  end

  describe 'edit' do
    let(:coleccion) {FactoryGirl.create(:coleccion)}
    before {visit edit_admin_coleccion_path(coleccion)}

    describe 'Con informacion invalida' do
      before {
        fill_in "Descripción", with: ''
        click_button 'Guardar'
      }
      it{should have_content('error')}
    end

    describe 'Con informacion valida' do
      let(:nuevo_url)  { "Física" }
      let(:nuevo_estado) { "I" }
      before {
        fill_in "URL", with: nuevo_url
        select nuevo_estado, :from => 'Estado'
        click_button 'Guardar'
      }

      specify { expect(coleccion.reload.url).to eq nuevo_url}
      specify { expect(coleccion.reload.estado).to eq nuevo_estado}
    end
  end
end
