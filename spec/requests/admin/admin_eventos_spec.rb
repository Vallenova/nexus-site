require 'rails_helper'

RSpec.describe "Admin::Eventos", :type => :request do
  # describe "GET /admin_eventos" do
  #   it "Eventos" do
  #     get admin_eventos_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  subject {page}

  let(:usuario) { FactoryGirl.create(:usuario) }

  before {
    visit admin_eventos_path
    fill_in "Email",    with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
  }

  describe 'index' do
  	it "Deberia tener el contenido Eventos" do
  	  visit admin_eventos_path
  	  expect(page).to have_content('Evento')
  	end
  end

  describe 'show' do
  	let(:evento) {FactoryGirl.create(:evento)}
  	before {visit admin_evento_path(evento)}

  	it {should have_content(evento.modalidad)}
  end

  describe 'new' do
    let!(:diplomado) {FactoryGirl.create(:diplomado)}
    
  	before {visit admin_nuevo_evento_path}
  	let(:enviar) {'Guardar'}

  	describe 'con informacion invalida' do
  	  it 'no debe crar un evento' do
  	  	expect {click_button enviar}.not_to change(Evento, :count)
  	  end
  	end

  	describe 'con informacion valida' do
      
      before do
        select 'Habilidades Directivas', :from => 'Diplomado'
        fill_in 'Fecha Inicio', with: '2015-01-27 08:16:37'
        fill_in 'Fecha Fin', with: '2015-01-27 08:16:37'
        select 'Virtual', :from => 'Modalidad'
        fill_in 'Inversión', with: '400'
        select 'Activo', :from => 'Estado'
      end

      it 'deberia crear un evento' do
        expect {click_button enviar}.to change(Evento, :count)
      end
    end
  end

  describe 'edit' do
    let!(:evento) {FactoryGirl.create(:evento)}

    before {visit edit_admin_evento_path(evento)}

    describe 'Con informacion invalida' do
      before {
        fill_in 'Inversión', with: ''
        click_button 'Guardar'
      }

      it {should have_content('error')}
    end

    describe 'Con informacion valida' do
      let(:nuevo_inicio) { "2015-01-27 08:16:37" }
      let(:nuevo_estado) { "I" }
      before {
        fill_in 'Inicio', with: nuevo_inicio
        select nuevo_estado, from: 'Estado'
        click_button 'Guardar'
      }

      specify { expect(evento.reload.fecha_inicio).to eq nuevo_inicio }
      specify { expect(evento.reload.estado).to eq nuevo_estado }
    end
  end

end