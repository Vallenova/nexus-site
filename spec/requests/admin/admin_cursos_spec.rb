require 'rails_helper'

RSpec.describe "Admin::Cursos", :type => :request do
  # describe "GET /admin_cursos" do
  #   it "Cursos" do
  #     get admin_cursos_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  subject {page}

  let(:usuario) { FactoryGirl.create(:usuario) }


  before {
    visit admin_cursos_path
    fill_in "Email",    with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
  }

  describe 'index' do
  	it "Deberia tener el contenido Curso" do
  	  visit admin_cursos_path
  	  expect(page).to have_content('Curso')
  	end
  end

  describe 'show' do
  	let(:curso) {FactoryGirl.create(:curso)}
  	before {visit admin_curso_path(curso)}

  	it {should have_content(curso.nombre)}
  end

  describe 'new' do

    let!(:modulo) {FactoryGirl.create(:modulo)}
    
  	before {visit admin_nuevo_curso_path}
  	let(:enviar) {'Guardar'}

  	describe 'con informacion invalida' do
  	  it 'no debe crar un curso' do
  	  	expect {click_button enviar}.not_to change(Curso, :count)
  	  end
  	end

  	describe 'con informacion valida' do
      
      before do
        select 'Modulo 1', :from => 'Módulo'
        fill_in 'Nombre', with: 'Curso 1'
        select 'Activo', :from => 'Estado'
      end

      it 'deberia crear un curso' do
        expect {click_button enviar}.to change(Curso, :count)
      end
    end
  end

  describe 'edit' do
    let!(:curso) {FactoryGirl.create(:curso)}

    before {visit edit_admin_curso_path(curso)}

    describe 'Con informacion invalida' do
      before {
        fill_in 'Nombre', with: ''
        click_button 'Guardar'
      }

      it {should have_content('error')}
    end

    describe 'Con informacion valida' do
      let(:nuevo_nombre) { "Curso 2" }
      let(:nuevo_estado) { "I" }
      before {
        fill_in 'Nombre', with: nuevo_nombre
        select nuevo_estado, from: 'Estado'
        click_button 'Guardar'
      }

      specify { expect(curso.reload.nombre).to eq nuevo_nombre }
      specify { expect(curso.reload.estado).to eq nuevo_estado }
    end
  end
end
