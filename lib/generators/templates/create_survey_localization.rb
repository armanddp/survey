class CreateSurveyLocalization < ActiveRecord::Migration
  def self.up
    Survey::Question.create_translation_table!({
      :text => :text
    }, {
      :migrate_data => true
    })
    Survey::Option.create_translation_table!({
      :text => :text
    }, {
      :migrate_data => true
    })
    Survey::Survey.create_translation_table!({
      :name => :string, 
      :description => :text
    }, {
      :migrate_data => true
    })
  end
  
  def self.down
    Survey::Question.drop_translation_table! :migrate_data => true
    Survey::Option.drop_translation_table! :migrate_data => true
    Survey::Survey.drop_translation_table! :migrate_data => true
  end
end
