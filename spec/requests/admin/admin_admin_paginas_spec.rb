require 'rails_helper'

RSpec.describe "Admin::AdminPaginas", :type => :request do
  subject { page }

  describe "GET /admin_admin_paginas" do
    describe "Como usuario sin identificar" do
      before { get admin_root_path }
      specify { expect(response).to redirect_to(new_usuario_session_path) }
    end
  end

  #subject { page }

  describe "signup" do

    before { visit new_usuario_registration_path }
    let(:submit) { "Sign up" }

    describe "Con informacion invalida" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Usuario, :count)
      end
    end

    describe "Con información valida" do
      before do
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "ficticio"
        fill_in "Password confirmation", with: "ficticio"
      end

      it "debe crear un usuario" do
        expect { click_button submit }.to change(Usuario, :count).by(1)
      end

      describe 'despues de registrar un usuario' do
        before do
          click_button submit
          visit admin_root_path
        end
             

        it {should have_content('Bienvenido')}
      end
    end
  end
end
