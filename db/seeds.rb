# Crear Usuarios con roles "Operador" y "Administrador"
roles = ["Operador", "Administrador"]

roles.each do |role|
  User.create(
    email: "#{role.downcase}@example.com",
    password: "123456",
    password_confirmation: "123456",
    role: role
  )
end

# Crear Motores con nombres REAC-n y TURBO-n
engine_types = ["Motor a reacción", "Motor turbohélice"]
max_engine_count = 100 # Cambia esto al número máximo deseado

max_engine_count.times do |n|
  type = engine_types[n % 2] # Alternar entre los tipos de motores
  name = "#{type == 'Motor a reacción' ? 'REAC' : 'TURBO'}-#{n + 1}"
  description = "Descripción del Motor #{n + 1}"
  photo = "motor#{n + 1}.jpg"

  Engine.create(type: type, name: name, description: description, photo: photo)
end

# Crear Mantenimientos
maintenance_types = ["Preventivo", "Correctivo"]
max_maintenance_count = 100 # Cambia esto al número máximo deseado

cities = ["Santiago de Chile", "Temuco", "Antofagasta"] # Lista de ciudades

max_maintenance_count.times do |n|
  maintenance_type = maintenance_types[n % 2] # Alternar entre los tipos de mantenimiento
  engine = Engine.all.sample # Seleccionar un motor aleatorio
  city = cities.sample # Seleccionar una ciudad aleatoria
  materials = ["Turbinas", "Sistemas de ignición", "Sistemas de combustible"].sample(2).join(", ") # Seleccionar dos materiales aleatorios y combinarlos
  technician_email = "tecnico#{n + 1}@example.com"
  maintenance_date = Faker::Date.between(from: 1.year.ago, to: Date.today) # Usar Faker para fechas aleatorias

  Maintenance.create(
    engine: engine,
    type: maintenance_type,
    city: city,
    materials: materials,
    technician_email: technician_email,
    maintenance_date: maintenance_date
  )
end
