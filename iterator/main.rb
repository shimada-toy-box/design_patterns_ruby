require 'array_iterator'
require 'portfolio'
require 'account'

# 外部イテレータ
array = %w(red green blue)
ite = ArrayIterator.new(array)

# これでもうまく動く
# ite = ArrayIterator.new("abc")

while ite.has_next?
  puts "item: #{ite.next_item}"
end


# 内部イテレータ
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

a = [10, 20, 30]
for_each_element(a) { |element| puts "The element is #{element}" }

# Enumerableの実装例
my_portfolio = Portfolio.new
my_portfolio.add_account Account.new("メイン口座", 10_000)
my_portfolio.add_account Account.new("投資口座",   20_000)
my_portfolio.add_account Account.new("貯蓄口座",   30_000)

# map, any, all, sort, max, minなどが使える
p "残高が2万円以上の口座があります" if my_portfolio.any? { |account| account.balance >= 20_000 }