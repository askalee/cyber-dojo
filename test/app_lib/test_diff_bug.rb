class DiffBugTests < CyberDojoTestBase
      'diff --git a/sandbox/recently_used_list.cpp b/sandbox/was_recently_used_list.test.cpp',
      'similarity index 100%',
      'copy from sandbox/recently_used_list.cpp',
      'copy to sandbox/was_recently_used_list.test.cpp',
            'diff --git a/sandbox/recently_used_list.cpp b/sandbox/was_recently_used_list.test.cpp',
            'similarity index 100%',
            'copy from sandbox/recently_used_list.cpp',
            'copy to sandbox/was_recently_used_list.test.cpp',
      'b/sandbox/was_recently_used_list.test.cpp' => expected_diff
            '',
            'def as_time(t)',
            '  [t.year, t.month, t.day, t.hour, t.min, t.sec]',
            'end',
            '',
            'def gapper(lights, from, to, secs_per_gap)',
            '  gaps = [as_time(from)]  ',
            '  while (from + secs_per_gap < to)',
            '    from += secs_per_gap;',
            '    gaps << as_time(from)',
            '  end',
            '  gaps',
            'end',
            '',
            ''
            'diff --git a/sandbox/gapper.rb b/sandbox/gapper.rb',
            'index 6cf082b..08e1893 100644',
              :before_lines => [ '  gaps', 'end', '' ],
      'diff --git a/sandbox/xx.rb b/sandbox/xx.rb',
      'deleted file mode 100644',
      'index e69de29..0000000'
      'a/sandbox/xx.rb' =>
          'diff --git a/sandbox/xx.rb b/sandbox/xx.rb',
          'deleted file mode 100644',
          'index e69de29..0000000'
        :was_filename => 'a/sandbox/xx.rb',
        :now_filename => '/dev/null',
    actual_view = git_diff(diff_lines, visible_files)