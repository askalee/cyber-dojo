
# comments at end of file
# See cyber-dojo-model.pdf

class Dojo

  def languages
    @languages ||= Languages.new(self, external_path(cd_root))
  end

  def exercises
    @exercises ||= Exercises.new(self, external_path(cd_root))
  end

  def katas
    @katas ||= Katas.new(self, external_path(cd_root))
  end

  def runner
    @runner ||= new_obj(external(cd_class_name))
  end

  def disk
    @disk ||= new_obj(external(cd_class_name))
  end

  def git(*args)
    @git ||= new_obj(external(cd_class_name))
    return @git if args == []
    command = args.delete_at(1)
    @git.send(command,*args)    
  end

  #one_self
  
private

  def new_obj(name)
    Object.const_get(name).new  
  end
  
  def external_path(key)
    result = external(key)
    raise RuntimeError.new("ENV['#{key}']='#{result}' must end in /") if !result.end_with? '/'
    result
  end
  
  def external(key)
    result = ENV[key]
    raise RuntimeError.new("ENV['#{key}'] not set") if result.nil?
    result
  end
  
  def cd_root
    cd(name_of(caller[0]) + '_ROOT')
  end
  
  def cd_class_name
    cd(name_of(caller[0]) + '_CLASS_NAME')
  end
  
  def cd(key)
    'CYBER_DOJO_' + key
  end

  def name_of(caller)
    (caller =~ /`([^']*)'/ and $1).upcase
  end
    
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# External paths/objects are set via environment variables
# (see config/initializers/cyber_dojo.rb)
#
# The main reason for this arrangement is testability.
# It allows me to do polymorphic testing, viz to run
# the *same* test multiple times under different environments.
# For example, I could run a test with all the externals mocked
# out (a true unit test) and then run the same test again with
# the true externals in place (an integration/system test).
#
# It also greatly expands the reach of the tests I can perform.
# For example, I can run controller tests in the same
# polymorphic testing manner: set the environment variables,
# then run the test which issue a GET/POST, let the call
# work its way through the rails stack, eventually getting
# back to Dojo.rb where it picks up the externals as setup.
#
# I cannot see how how I do this using Parameterize From Above
# since I know of no way to 'tunnel' the parameters 'through'
# the rails stack.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
