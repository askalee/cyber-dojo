ENV["RAILS_ENV"] = "test"
require 'simplecov'

module SimpleCov::Configuration
  def clean_filters
    @filters = [ ]
  end
end

SimpleCov.start do
  add_filter "/ruby-1.9.3-p125/"
  add_filter "/cyberdojo/config/"
  
  add_group 'app/controllers', 'app/controllers'
  add_group 'app/models',      'app/models'
  add_group 'app/helpers',     'app/helpers'
  add_group 'app/lib',         'app/lib'  
  
  add_group 'lib'             do |src_file|
    src_file.filename.include?('lib') &&
    !src_file.filename.include?('app/lib')
  end

end

SimpleCov.root '/Users/jonjagger/Desktop/Repos/cyberdojo'

