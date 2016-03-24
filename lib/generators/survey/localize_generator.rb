module Survey
  module Generators
    class LocalizeGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def copy_migration
        unless !::Survey.localizable? || localize_migration_already_exists?
          timestamp_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          copy_file "create_survey_localization.rb", "db/migrate/#{timestamp_number}_create_survey_localization.rb"
        end
      end

      private

      def localize_migration_already_exists?
         Dir.glob("#{File.join(destination_root, File.join("db", "migrate"))}/[0-9]*_*.rb").grep(/\d+_create_survey_localization.rb$/).first
      end
    end
  end
end
