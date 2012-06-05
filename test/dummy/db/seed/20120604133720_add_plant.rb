class AddPlant < ActiveRecord::SeedMigration
  
  def self.up
    Plant.create  
  end
  
end
