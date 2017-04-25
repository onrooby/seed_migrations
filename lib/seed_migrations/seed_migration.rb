class ActiveRecord::SeedMigration < ActiveRecord::Base
  
  def self.load_seeds
    puts 'Loading all seeds'
    ensure_table_is_set
    Dir.chdir(File.join(Rails.root, "db", "seed"))
    seeds = Dir.glob('*.rb').sort.each do |file_name|
      if seed_name = file_name.match(/[0-9]+_(.*).rb/).captures.first
        unless find_by_name(file_name.chomp('.rb'))
          ActiveRecord::Base.transaction do                        
            puts "- Loading data from #{file_name}"    
            load File.join(Rails.root, "db", "seed", file_name)
            seed_class = begin
              seed_name.camelize.constantize
            rescue NameError => n
              puts 'No appropriate class specified in the file! Skipping it!'
            end
            seed_class.up if seed_class
            seed = new
            seed.name = file_name.chomp('.rb')
            seed.save!
          end
        end
      end
    end
  end
  
  def self.reload_last_seed
    puts 'Reloading last seed'
    ensure_table_is_set
    if last_seeding = last
      seed_name = last_seeding.name.match(/[0-9]+_(.*)/).captures.first
      ActiveRecord::Base.transaction do        
        puts "- Loading data from #{last_seeding.name}.rb"
        load File.join(Rails.root, "db", "seed", last_seeding.name + '.rb')
        seed_class = begin
          seed_name.camelize.constantize
        rescue NameError => n
          puts 'No appropriate class specified in the file! Skipping it!'
        end
        seed_class.up if seed_class
      end
    end
  end
  
  private 
  
  def self.ensure_table_is_set
    create_seed_migrations_table unless ActiveRecord::Migration.data_source_exists?("seed_migrations")
  end
  
  def self.create_seed_migrations_table
    ActiveRecord::Migration.create_table :seed_migrations do |t|
      t.string :name, :null => false
      t.timestamps
    end
    ActiveRecord::Migration.add_index("seed_migrations", :name, :unique => true)
  end

end
