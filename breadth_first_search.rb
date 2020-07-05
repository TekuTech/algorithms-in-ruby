=begin
- グラフとはなにか
一連のつながりをモデル化したもの。ノードと辺で構成される。

- 最短経路問題について
グラフのある地点からある地点に到達する経路の有無や最短ステップ数を求める問題。
最短経路を求めるためには幅優先探索(breadth-first search)のアルゴリズムを用いる。

- コードでノードをどう表現するか
ハッシュテーブル。
=end

# 問題: ノードからマンゴー販売業者を見つけなさい
class BreadthFirstSearch
  NODES = {
    you: %i[alice bob claire],
    bob: %i[anuj peggy],
    alice: %i[peggy],
    claire: %i[thom jonny],
    anuj: [],
    peggy: [],
    thom: [],
    jonny: []
  }.freeze

  attr_accessor :queue, :searched

  def initialize
    # 隣接ノードをキューに追加
    @queue = NODES[:you]
    @searched = []
  end

  def search
    puts '幅優先探索を行います。'
    until queue.empty?
      # キューから1人をポップ
      person = queue.shift
      next if searched?(person)

      if seller?(person)
        puts "#{person.to_s}はマンゴー販売業者です！"
        puts '幅優先探索を終了します。'
        return
      else
        # 販売業者でなければ、隣接ノードをキューに追加して検索済みにする
        puts "#{person}はマンゴー販売業者じゃないようです。"
        puts "隣接ノードをキューに追加します。 #{NODES[person]}"
        puts
        queue.concat(NODES[person])
        searched << person
      end
    end
  end

  private

  # 名前の末尾がmならマンゴー販売業者とみなす
  def seller?(person)
    person.to_s[-1] == 'm'
  end

  def searched?(person)
    searched.include?(person)
  end
end

BreadthFirstSearch.new.search
