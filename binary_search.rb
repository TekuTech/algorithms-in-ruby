require 'benchmark'

class BinarySearch
  attr_accessor :nums
  attr_reader :target_num

  def initialize
    @nums = (1..300).to_a
    @target_num = rand(300)
  end

  def start
    puts '二分探索を開始します。'
    puts "対象の数値: #{target_num}"
    puts

    until correct?
      narrow_down
      puts "絞り込み後の配列: #{nums}"
      puts
    end

    puts "答えは#{middle_number}ですね！"
  end

  private

  # 中央値をとる
  def middle_number
    nums[(nums.size - 1) / 2]
  end

  # 正解か判定する
  def correct?
    middle_number == target_num
  end

  # 中央値より大きいか小さいかを判定する
  def too_high?
    middle_number < target_num
  end

  # 中央値より高い（低い）数値のみの配列を代入する
  def narrow_down
    @nums =
      if too_high?
        puts "中央値(#{middle_number})より大きいようです。"
        nums.select { |n| n > middle_number }
      else
        puts "中央値(#{middle_number})より小さいようです。"
        nums.select { |n| n < middle_number }
      end
  end
end

bs = BinarySearch.new
bs.start
