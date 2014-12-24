
class Languages

  include Enumerable

  def initialize(path)
    raise_if_no([:disk])
    @path = path
  end

  attr_reader :path

  def each
    # dojo.languages.each { |language| ... }
    languages.each do |language|
      yield language if block_given?
    end
  end

  def [](name)
    # dojo.languages[name]
    make_language(name)
  end

private

  include Externals

  def languages
    @languages ||= make_cache
  end

  def make_cache
    cache = [ ]
    dir.each do |sub_dir|
      language = make_language(sub_dir)
      cache << language if language.exists? && language.runnable?
    end
    cache
  end

  def make_language(name)
    Language.new(path,name)
  end

end
