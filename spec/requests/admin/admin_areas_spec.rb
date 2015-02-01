require 'rails_helper'

RSpec.describe "Admin::Areas", :type => :request do
  subject {page}

  let(:usuario) { FactoryGirl.create(:usuario) }


  before {
    #visit new_usuario_session_path
    visit admin_areas_path
    fill_in "Email",    with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
  }

  

  # describe "GET /admin_areas" do
  #   it "Areas" do
  #     visit admin_areas_path
  #     #expect(response).to have_http_status(200)
  #     expect(current_path).should eq(admin_areas_path)
  #     #current_path.should == admin_areas_path
  #   end
  # end

  describe "index" do

    it "Deberia tener el contenido 'Nombre'" do
      visit admin_areas_path
      expect(page).to have_content('Nombre')
    end
  end

  describe "show" do

    let(:area) {FactoryGirl.create(:area)}
    before {visit admin_area_path(area)}

    it {should have_content(area.nombre)}
  end

  describe "new" do
    before {visit admin_nueva_area_path}
    let(:enviar) {"Guardar"}

    describe "con informacion invalida" do
      it "no debe crear un area" do
        expect { click_button enviar }.not_to change(Area, :count)
      end
    end


    describe "con informacion valida" do
      before do
        fill_in "Nombre", with: "Ingenieria"
        select 'Activo', :from => 'Estado'
        fill_in "Picture", with: "bg4.jpg"
      end

      it "deberia crear un area" do
        expect { click_button enviar }.to change(Area, :count)
       end

    end
  end

  describe 'edit' do
    let(:area) {FactoryGirl.create(:area)}
    before {visit edit_admin_area_path(area)}

    describe 'Con informacion invalida' do
      before {
        fill_in "Nombre", with: ''
        click_button 'Guardar'
      }
      it{should have_content('error')}
    end

    describe 'Con informacion valida' do
      let(:nuevo_nombre)  { "Física" }
      let(:nuevo_estado) { "I" }
      before {
        fill_in "Nombre", with: nuevo_nombre
        select nuevo_estado, :from => 'Estado'
        click_button 'Guardar'
      }

      specify { expect(area.reload.nombre).to eq nuevo_nombre}
      specify { expect(area.reload.estado).to eq nuevo_estado}
    end
  end
end