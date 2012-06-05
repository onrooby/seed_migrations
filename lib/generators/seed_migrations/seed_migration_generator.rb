class SeedMigrationGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  desc "This generator creates a seed file at db/seeds"
  def create_seed
    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
    base_name = "#{timestamp}_#{file_name}" 
    template "seed_migration.rb", "db/seed/#{base_name}.rb"
  end
end

