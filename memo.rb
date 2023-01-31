require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

def get_filename
  input = gets
  if (input == nil)
    input = ""
  else
    return name = input.chomp!
  end
end

def announce
  text = <<TEXT
メモしたい内容を記入してください。
終了したら「Ctrl + D」を押してください。
TEXT
  puts text
end

def memo_mode(name, str)
  input = readlines
  CSV.open("#{name}.csv", str) do |memo|
    memo << input
  end
end

def new_memo
  filename = get_filename
  if filename.empty?
    puts "ファイル名が入力されていません"
    new_memo
  else
    announce
    memo_mode(filename, "w")
  end
end

def edit_memo
  filename = get_filename
  if filename.empty?
    puts "ファイル名が入力されていません"
    edit_memo
  else
    announce
    memo_mode(filename, "a")
  end
end

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  new_memo
elsif memo_type == 2
  puts "編集したいファイル名を記入してください。"
  edit_memo
else
  puts "もう一度実行してください。"
end