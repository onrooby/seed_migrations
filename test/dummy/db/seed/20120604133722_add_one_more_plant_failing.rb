class AddOneMorePlantFailing < ActiveRecord::SeedMigration
  class SeedMigrations::Nope < StandardError; end

  def self.up
    Plant.create
    raise SeedMigrations::Nope
  end
  
end
