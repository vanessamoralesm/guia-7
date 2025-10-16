# Este archivo se carga para pruebas que requieren Rails
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Evita que las pruebas se ejecuten en producción por accidente
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'shoulda/matchers'

# Mantiene el esquema actualizado antes de correr pruebas
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Ruta para fixtures si las usás
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # Usa transacciones para mantener la base limpia entre pruebas
  config.use_transactional_fixtures = true

  # Filtra trazas largas de Rails en errores
  config.filter_rails_from_backtrace!

  # Configuración de Shoulda Matchers
  Shoulda::Matchers.configure do |shoulda_config|
    shoulda_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end