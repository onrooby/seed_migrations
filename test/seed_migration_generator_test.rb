require 'test_helper'

class SeedMigrationGeneratorTest < Rails::Generators::TestCase
  tests SeedMigrationGenerator
  destination File.expand_path("../tmp/", File.dirname(__FILE__))
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator %w{ big_elephant }
    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
    base_name = "#{timestamp}_big_elephant"
    assert_file "db/seed/#{base_name}.rb"

    run_generator %w{ SmallElephant }
    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
    base_name = "#{timestamp}_small_elephant"
    assert_file "db/seed/#{base_name}.rb"
  end

end
