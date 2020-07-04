=begin
- 分割統治について
1. 基本ケースを特定する。基本ケースはできる限り単純なケースでなければならない。
2. 基本ケースになるまで問題を分割（縮小）していく。

- クイックソート
1. ピボットを選ぶ。
2. 配列のパーティショニングを行い、2つの部分配列（ピボットより大きい/小さい）に分割する。
3. 2つの部分配列でクイックソートを再帰的に呼び出す。
=end

def quick_sort(array)
  if array.size < 2
    array
  else
    # パーティショニング
    pivot = array.first
    less = array.select { |num| num < pivot }
    greater = array.select { |num| num > pivot }

    # それぞれの配列に対して再帰処理を行う
    quick_sort(less) + [pivot] + quick_sort(greater)
  end
end

array = (1..20).to_a.shuffle
puts "クイックソート前の配列:"
puts "#{array}"
puts

sorted_array = quick_sort(array)
puts "クイックソート後の配列:"
puts "#{sorted_array}"
