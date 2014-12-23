require 'rails_helper'

RSpec.describe "Admin::AdminPaginas", :type => :request do
  describe "GET /admin_admin_paginas" do
    it "AdminPaginas" do
      get admin_root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "index" do

    it "Deberia tener el contenido 'administrar'" do
      visit admin_root_path
      expect(page).to have_content('administrar')
    end
  end
end
