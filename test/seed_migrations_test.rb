require 'test_helper'

class SeedMigrationsTest < ActiveSupport::TestCase
  class SeedMigrations::Nope < StandardError; end

  setup do
    Rake.application.rake_require "tasks/seed_migrations_tasks"
    Rake::Task.define_task(:environment)
    Rake::Task['db:seed'].reenable
  end


  test 'loading seeds is possible' do
    assert_difference("Plant.count", 2) do
      assert_raise(SeedMigrations::Nope) { Rake::Task['db:seed'].invoke }
    end
  end

  test 'loading seeds happens only once' do
    assert_difference("Plant.count", 2) do
      assert_raise(SeedMigrations::Nope) { Rake::Task['db:seed'].invoke }
    end
    Rake::Task['db:seed'].reenable
    assert_difference("Plant.count", 0) do
      assert_raise(SeedMigrations::Nope) { Rake::Task['db:seed'].invoke }
    end
  end

  test 'reloading the last seed is possible' do
    assert_difference("Plant.count", 2) do
      assert_raise(SeedMigrations::Nope) { Rake::Task['db:seed'].invoke }
    end
    assert_difference("Plant.count", 1) do
      Rake::Task['db:seed:last'].invoke
    end
  end
end
