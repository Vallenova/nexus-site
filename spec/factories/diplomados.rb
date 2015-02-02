# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :area do
    nombre "Administración"
    estado "A"
    picture "bg4.jpg"
  end
  
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

  factory :modulo do
    nombre "Modulo 1"
    estado "A"
    diplomado
  end

  factory :curso do
    nombre "Curso 1"
    estado "A"
    modulo
  end

  factory :area_diplomado do
    estado "A"
    area
    diplomado
  end

  factory :evento do
    fecha_inicio "2015-01-29 08:16:37"
    fecha_fin "2015-01-29 08:16:37"
    modalidad "Virtual"
    inversion 1
    estado "A"
    diplomado
  end

end
