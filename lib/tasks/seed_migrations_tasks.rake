namespace :db do

  desc 'Load all new seeds'
  task :seed => :environment do
    ActiveRecord::SeedMigration.load_seeds
  end

  desc 'Reload the last successfully performed seed'
  namespace :seed do
    task :last => :environment do
      ActiveRecord::SeedMigration.reload_last_seed
    end
  end
end

