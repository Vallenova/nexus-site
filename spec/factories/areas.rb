# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :area do
    nombre "Administración"
    estado "A"
    #picture "bg4.jpg"
    picture File.open(File.join(Rails.root, '/spec/support/archivos/bg4.jpg'))
  end
end
