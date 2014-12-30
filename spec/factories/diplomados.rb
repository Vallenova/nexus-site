# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :diplomado do
    nombre "Habilidades Directivas"
    estado "A"
    descripcion "Diplomado en habilidades directivas"
    objetivos "Objetivo 1| Objetivo 2| Objetivo 3| Objetivo 4"
    dirigido "Profesionales| Bachilleres"
    creditos "24"
    horas_acad "24"
    inversion "24"
    picture "https://dominio.com/fotografia.jpg"
  end
end
