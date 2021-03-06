#!/usr/bin/env ../test_wrapper.sh app/models

require_relative 'model_test_base'

class ExercisesTests < ModelTestBase

  test 'path is set from ENV' do
    path = 'end_with_slash/'
    set_exercises_root(path)
    assert_equal path, exercises.path
    assert path_ends_in_slash?(exercises)
    assert path_has_no_adjacent_separators?(exercises)    
  end

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  test 'path is forced to end in a slash' do
    path = 'unslashed'
    set_exercises_root(path)
    assert_equal path+'/', exercises.path
    assert path_ends_in_slash?(exercises)
    assert path_has_no_adjacent_separators?(exercises)    
  end

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  test 'each() empty' do
    set_disk_class_name('DiskFake')
    assert_equal [], exercises_names
  end
  
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  test 'each() gives all exercises which exist' do
    sample_exercises_names.each do |name|
      assert exercises_names.include? name
    end    
  end

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  test 'is Enumerable, eg each() not needed if doing a map' do
    sample_exercises_names.each do |name|
      assert exercises_names.include? name
    end    
  end
  
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  test 'exercises[X] is exercise named X' do
    sample_exercises_names.each do |name|
      assert_equal name, exercises[name].name
    end
  end

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def exercises_names
    exercises.map {|exercise| exercise.name }
  end

  def sample_exercises_names
    %w( Unsplice Verbal Fizz_Buzz )
  end
  
end
