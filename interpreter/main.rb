require 'all'
require 'file_name'
require 'bigger'
require 'writable'
require 'not'
require 'or'
require 'and'

# すべてのファイル名を取得
expr_all = All.new
files = expr_all.evaluate('test_dir')
p "files: #{files}"

# ファイル名が"*.mp3"に合致するファイル名を取得
expr_mp3 = FileName.new('*.mp3')
mp3s = expr_mp3.evaluate('test_dir')
p "mp3s: #{mp3s}"

# 書き込みできないファイル名を取得
expr_not_writable = Not.new( Writable.new )
readonly_files = expr_not_writable.evaluate('test_dir')
p "readonly files: #{readonly_files}"

# 1KBより小さいファイル名を取得
small_expr = Not.new( Bigger.new(1024) )
small_files = small_expr.evaluate('test_dir')
p "small files: #{small_files}"

# 書き込み可能でない、大きなMP3ファイルを検索
complex_expression = And.new(
                        And.new( Bigger.new(1024), FileName.new('*.mp3') ),
                        Not.new( Writable.new )
                      )
complex_expr_files = complex_expression.evaluate('test_dir')
p "complex expr files: #{complex_expr_files}"
