require 'minitest/autorun'


class Triple
  include Enumerable
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
    @array=[a,b,c]
  end

  def getter
    return @array
  end


  def each

    yield @a
    yield @b
    yield @c

  end



end

class Easy
  include Enumerable
  def each
    yield 1
    yield 1,2
    yield
  end
end




class Testany < Minitest::Unit::TestCase
  def setup
    @test1 = Triple.new(1,2,3)
    @test2 = Triple.new('s', 'd' ,'f' )
    @test3 = Triple.new(nil, nil , nil )
    @test4 = Triple.new(1, nil, 3)
    @test5 = Triple.new( 's', nil, 'f')
    @test6 = Triple.new( 1, nil, 'd')
    @test7 = Triple.new(1, 2, 'g')

  end



  def test_all?
    assert_equal true,  @test1.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test2.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test3.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test4.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test5.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test6.all?{|x| x.is_a?(Integer)}
    assert_equal false, @test7.all?{|x| x.is_a?(Integer)}
  end

  def test_any?
    assert_equal true, @test1.any?{|x| x.is_a?(Integer)}
    assert_equal false,  @test2.any?{|x| x.is_a?(Integer)}
    assert_equal false,  @test3.any?{|x| x.is_a?(Integer)}
    assert_equal true,  @test4.any?{|x| x.is_a?(Integer)}
    assert_equal false,  @test5.any?{|x| x.is_a?(Integer)}
    assert_equal true,  @test6.any?{|x| x.is_a?(Integer)}
    assert_equal true,  @test7.any?{|x| x.is_a?(Integer)}
  end

  # def test_chunk?
  #    @chunkarr = Triple.getter
  #    assert_equal [true, [1,2,3], @test1.chunk{|chunkarr| chunkarr.is_a?(Integer)}.each{|| }}
  # end

  def test_count?
    assert_equal 3, @test1.count
    assert_equal 3, @test2.count
    assert_equal 3, @test3.count
    assert_equal 3, @test4.count
    assert_equal 3, @test5.count
    assert_equal 3, @test6.count
    assert_equal 3, @test7.count

  end

  def test_countitem?
    assert_equal 1, @test1.count(1)
    assert_equal 0, @test2.count(1)
    assert_equal 0, @test3.count(1)
    assert_equal 1, @test4.count(1)
    assert_equal 0, @test5.count(1)
    assert_equal 1, @test6.count(1)
    assert_equal 1, @test7.count(1)
  end

  def test_countblock?
    assert_equal 3, @test1.count{|x| x.is_a?(Integer)}
    assert_equal 0, @test2.count{|x| x.is_a?(Integer)}
    assert_equal 0, @test3.count{|x| x.is_a?(Integer)}
    assert_equal 2, @test4.count{|x| x.is_a?(Integer)}
    assert_equal 0, @test5.count{|x| x.is_a?(Integer)}
    assert_equal 1, @test6.count{|x| x.is_a?(Integer)}
    assert_equal 2, @test7.count{|x| x.is_a?(Integer)}

  end

  def test_limitcircle?
    arr1 = Array.new
    @test1.cycle(2){|x| arr1 << x}
    assert_equal [1,2,3,1,2,3], arr1

    arr2 = Array.new
    @test2.cycle(2){|x| arr2<< x}
    assert_equal ['s','d','f','s','d','f'], arr2

    arr3 = Array.new
    @test3.cycle(2){|x| arr3<< x}
    assert_equal [nil,nil,nil,nil,nil,nil], arr3

    arr4 = Array.new
    @test4.cycle(2){|x| arr4<< x}
    assert_equal [1, nil,3,1,nil,3], arr4

    arr5 = Array.new
    @test5.cycle(2){|x| arr5<< x}
    assert_equal ['s',nil,'f','s',nil,'f'], arr5

    arr6 = Array.new
    @test6.cycle(2){|x| arr6<< x}
    assert_equal [1,nil,'d',1,nil,'d'], arr6

    arr7 = Array.new
    @test7.cycle(2){|x| arr7<<x}
    assert_equal [1,2,'g',1,2,'g'], arr7

  end

  def test_detectblock?
    assert_equal 1, @test1.detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test2.detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test3.detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test4.detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test5.detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test6.detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test7.detect{|x| x.is_a?(Integer)}


  end


  def test_drop?


       assert_equal [3], @test1.drop(2)
       assert_equal ['f'], @test2.drop(2)
       assert_equal [nil], @test3.drop(2)
       assert_equal [3], @test4.drop(2)
       assert_equal ['f'], @test5.drop(2)
       assert_equal ['d'], @test6.drop(2)
       assert_equal ['g'], @test7.drop(2)

  end


  def test_dropwhile?


          arr1 = Array.new
          arr1<<@test1.drop_while{|i| i.is_a?(Integer)}
          assert_equal [[]], arr1


          arr2 = Array.new
           arr2<<@test2.drop_while{|i| i.is_a?(Integer)}

          assert_equal [['s','d','f']], arr2

          arr3 = Array.new
          arr3<<@test3.drop_while{|i| i.is_a?(Integer)}
          assert_equal [[nil,nil,nil]], arr3


          arr4 = Array.new
          arr4<<@test4.drop_while{|i| i.is_a?(Integer)}
          assert_equal [[nil,3]], arr4

          arr5 = Array.new
          arr5<<@test5.drop_while{|i| i.is_a?(Integer)}
          assert_equal [['s',nil,'f']], arr5


          arr6 = Array.new
          arr6<<@test6.drop_while{|i| i.is_a?(Integer)}
          assert_equal [[nil,'d']], arr6

          arr7 = Array.new
          arr7<<@test7.drop_while{|i| i.is_a?(Integer)}
          assert_equal [['g']], arr7

  end


  def test_dpwhile

     assert_equal [1], @test1.drop_while.to_a
     assert_equal ['s'], @test2.drop_while.to_a
     assert_equal [nil], @test3.drop_while.to_a
     assert_equal [1], @test4.drop_while.to_a
     assert_equal ['s'], @test5.drop_while.to_a
    assert_equal [1], @test6.drop_while.to_a
    assert_equal [1], @test7.drop_while.to_a
  end


   def test_eachcon

     arr1 = Array.new
     @test1.each_cons(2){|a| arr1<< a}
      assert_equal [[1,2],[2,3]], arr1

     arr2 = Array.new
     @test2.each_cons(2){|a| arr2<<a}
     assert_equal [['s','d'],['d','f']], arr2
      # assert_equal [[1,2][2,3]], arr1
   end

  def test_eachc
    arr1 =Array.new
    arr1<<@test1.each_cons(2).to_a
    assert_equal [[[1,2],[2,3]]],arr1

    arr2= Array.new
    arr2<<@test2.each_cons(2).to_a
    assert_equal [[['s','d'],['d','f']]],arr2
  end


  def test_entry
    assert_equal [1,2,3], @test1.each_entry.to_a
    assert_equal ['s','d','f'], @test2.each_entry.to_a

  end

  def test_entry2

     assert_equal [1,[1,2],nil], Easy.new.each_entry{|o| p o}.to_a
     #puts Easy.new.each_entry{|o| p o}
  end



  def test_slice
    arr= Array.new
    @test1.each_slice(2){|a| arr<<a}
     assert_equal [[1,2],[3]], arr

  end

  def test_slice1
    arr=Array.new
    arr<<@test1.each_slice(2).to_a
    assert_equal [[[1,2],[3]]],arr

  end

  def test_withindex
    hash = Hash.new
    assert_equal ['s','d','f'], @test2.each_with_index{|item, index| hash[item]=index}.to_a

  end

  
  def test_withindex2
    hash = Hash.new
    assert_equal [['s',0],['d',1],['f',2]], @test2.each_with_index.to_a
  end



  def test_withobj
    arr = Array.new
    arr<<@test1.each_with_object([]){|i,a| a<<i*2}
   assert_equal [[2,4,6]],arr
  end

  def test_withobj1
    arr = Array.new
    arr<<@test1.each_with_object([]).to_a

    #puts "wwq"
    #puts arr
    assert_equal [[[1, []],[2, []],[3, []]]],arr

  end


  def test_entries
   assert_equal [1,2,3], @test1.to_a
  end

  def test_find
    assert_equal 1,@test1.find{|i| i.is_a?(Integer)}
  end

  def test_find1

    assert_equal [1,2,3],@test1.find.to_a
  end


  def test_findall
    assert_equal [1,2,3], @test1.find_all{|i| i.is_a?(Integer)}
  end


  def test_findall1
    assert_equal [1,2,3], @test1.find_all.to_a
  end

  def test_findindex
    assert_equal 0, @test1.find_index{|i| i.is_a?(Integer)}
  end

  def test_findindex1
    assert_equal 1, @test2.find_index('d')
  end

  def test_findindex2

     assert_equal [1,2,3],@test1.find_index.to_a
  end


  def test_first
    assert_equal ['s'], @test2.first(1)
  end



  def test_first1
    assert_equal 1, @test1.first
  end

  def test_map
    assert_equal [1,-1,2,-2,3,-3], @test1.flat_map{|e| [e,-e]}
  end

  def test_grep
    assert_equal @test1.grep(1),[1]
  end

  def test_grep_v
    assert_equal @test1.grep_v(1),[2,3]
  end

  def test_group_by
    assert_equal @test1.getter.group_by{|x|x%2==0},{false=>[1, 3], true=>[2]}
  end

  def test_include?
    assert_equal @test1.include?(1),true
  end

  def test_inject

    assert_equal @test1.getter.inject{|sum,n|sum+n},6
  end

  def test_lazy

    assert_equal @test1.getter.lazy.to_a,[1,2,3]
  end

  def test_map
    assert_equal @test1.getter.map{|x|x*2},[2,4,6]
  end

  def test_max
    assert_equal @test1.max,3
  end

  def test_maxby
    assert_equal @test1.max_by{|x|x},3
  end

  def test_member?
    assert_equal @test1.getter.member?(1),true
  end

  def test_min
    assert_equal @test1.min{|x|x},1
  end

  def test_minby
    assert_equal @test1.min_by{|x|x},1
  end

  def test_minmax
    assert_equal @test1.minmax,[1,3]
  end

  def test_minmax_by
    assert_equal @test1.minmax_by{|x|x},[1,3]
  end

  def test_none?
    assert_equal @test1.none?{|x|x<1},true
  end

  def test_one?
    assert_equal @test1.one?{|x|x>1},false
  end

  def test_partition
    assert_equal @test1.getter.partition{|x|x>1},[[2,3],[1]]
  end

  def test_reduce
    assert_equal @test1.reduce(:+),6
  end

  def test_reject
    assert_equal @test1.getter.reject{|x|x%2==0},[1,3]
  end

  def test_reserve
    assert_equal @test1.getter.reverse_each.to_a,[3,2,1]
  end

  def test_select
    assert_equal @test1.select{|x|x%2==0},[2]
  end

  def test_slice_after
    assert_equal @test1.slice_after(1).to_a,[[1],[2,3]]
  end

  def test_slice_before

    assert_equal @test1.slice_before(1).to_a,[[1,2,3]]
  end

  def test_slice_when
    #puts "here??"
    #puts @test1.slice_when{|x,y|y=x+1}
    assert_equal @test1.slice_when{|x|x<2}.to_a,[[1],[2,3]]
  end

  def test_sort
    assert_equal @test1.sort,[1,2,3]
  end

  def test_sortby
    assert_equal @test1.sort_by{|x|x},[1,2,3]
  end

  def test_sum
    assert_equal @test1.getter.sum,6
  end

  def test_take
    assert_equal @test1.take(1),[1]
  end

  def test_to_a
    assert_equal @test1.getter.to_a,[1,2,3]
  end

  def test_to_h
    #puts  @test1.each_with_index.to_h.to_s
    #assert_equal @test1.each_with_index.to_h.to_s,{1=>0, 2=>1, 3=>2}
  end

  def test_unq
    assert_equal @test1.getter.uniq,[1,2,3]
  end

  def test_zip
    a=[0,0,0]
    puts "???????????"
    assert_equal @test1.zip(a).to_a,[[1,0],[2,0],[3,0]]
  end
  def test_detect?
  #   puts "here"
  #    puts @test1.detect
    assert_equal 2, @test1.detect{|x|x%2==0}
  end

  #
  #







end
