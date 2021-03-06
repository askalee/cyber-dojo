
class Exercises
  include ExternalParentChain
  include Enumerable
  
  def initialize(dojo,path)
    @parent,@path = dojo,path
    @path += '/' if !@path.end_with? '/'
  end
  
  attr_reader :path
  
  def each
    return enum_for(:each) unless block_given?
    exercises.each { |exercise| yield exercise }
  end

  def [](name)
    make_exercise(name)
  end

private

  def exercises
    @exercises ||= make_cache
  end

  def make_cache
    cache = [ ]
    dir.each_dir do |sub_dir|
      exercise = make_exercise(sub_dir)
      cache << exercise if exercise.exists?
    end
    cache
  end

  def make_exercise(name)
    Exercise.new(self,name)
  end

end
