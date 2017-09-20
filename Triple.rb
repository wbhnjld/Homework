$LOAD_PATH<<'.'
require 'WangEnumerable'
require 'minitest/autorun'



class Triple
  include Enumerable
  include WangEnumerable
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
    assert_equal true,  @test1.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test2.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test3.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test4.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test5.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test6.my_all{|x| x.is_a?(Integer)}
    assert_equal false, @test7.my_all{|x| x.is_a?(Integer)}
  end

  def test_any?
    assert_equal true, @test1.my_any{|x| x.is_a?(Integer)}
    assert_equal false,  @test2.my_any{|x| x.is_a?(Integer)}
    assert_equal false,  @test3.my_any{|x| x.is_a?(Integer)}
    assert_equal true,  @test4.my_any{|x| x.is_a?(Integer)}
    assert_equal false,  @test5.my_any{|x| x.is_a?(Integer)}
    assert_equal true,  @test6.my_any{|x| x.is_a?(Integer)}
    assert_equal true,  @test7.my_any{|x| x.is_a?(Integer)}
  end

  # def test_chunk?
  #    @chunkarr = Triple.getter
  #    assert_equal [true, [1,2,3], @test1.chunk{|chunkarr| chunkarr.is_a?(Integer)}.each{|| }}
  # end

  def test_count?
    assert_equal 3, @test1.my_count
    assert_equal 3, @test2.my_count
    assert_equal 3, @test3.my_count
    assert_equal 3, @test4.my_count
    assert_equal 3, @test5.my_count
    assert_equal 3, @test6.my_count
    assert_equal 3, @test7.my_count

  end

  def test_countitem?
    assert_equal 1, @test1.my_count(1)
    assert_equal 's', @test2.my_count(1)
    assert_equal nil, @test3.my_count(1)
    assert_equal 1, @test4.my_count(1)
    assert_equal 's', @test5.my_count(1)
    assert_equal 1, @test6.my_count(1)
    assert_equal 1, @test7.my_count(1)
  end

  def test_countblock?
    assert_equal 3, @test1.my_count{|x| x.is_a?(Integer)}
    assert_equal 0, @test2.my_count{|x| x.is_a?(Integer)}
    assert_equal 0, @test3.my_count{|x| x.is_a?(Integer)}
    assert_equal 2, @test4.my_count{|x| x.is_a?(Integer)}
    assert_equal 0, @test5.my_count{|x| x.is_a?(Integer)}
    assert_equal 1, @test6.my_count{|x| x.is_a?(Integer)}
    assert_equal 2, @test7.my_count{|x| x.is_a?(Integer)}

  end

  def test_limitcircle?
    arr1 = Array.new
    @test1.my_cycle(2){|x| arr1 << x}
    assert_equal [1,2,3,1,2,3], arr1

    arr2 = Array.new
    @test2.my_cycle(2){|x| arr2<< x}
    assert_equal ['s','d','f','s','d','f'], arr2

    arr3 = Array.new
    @test3.my_cycle(2){|x| arr3<< x}
    assert_equal [nil,nil,nil,nil,nil,nil], arr3

    arr4 = Array.new
    @test4.my_cycle(2){|x| arr4<< x}
    assert_equal [1, nil,3,1,nil,3], arr4

    arr5 = Array.new
    @test5.my_cycle(2){|x| arr5<< x}
    assert_equal ['s',nil,'f','s',nil,'f'], arr5

    arr6 = Array.new
    @test6.my_cycle(2){|x| arr6<< x}
    assert_equal [1,nil,'d',1,nil,'d'], arr6

    arr7 = Array.new
    @test7.my_cycle(2){|x| arr7<<x}
    assert_equal [1,2,'g',1,2,'g'], arr7

  end

  def test_detectblock?
    assert_equal 1, @test1.my_detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test2.my_detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test3.my_detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test4.my_detect{|x| x.is_a?(Integer)}
    assert_equal nil, @test5.my_detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test6.my_detect{|x| x.is_a?(Integer)}
    assert_equal 1, @test7.my_detect{|x| x.is_a?(Integer)}


  end


  def test_drop?


       assert_equal [3], @test1.my_drop(2)
       assert_equal ['f'], @test2.my_drop(2)
       assert_equal [nil], @test3.my_drop(2)
       assert_equal [3], @test4.my_drop(2)
       assert_equal ['f'], @test5.my_drop(2)
       assert_equal ['d'], @test6.my_drop(2)
       assert_equal ['g'], @test7.my_drop(2)

  end


  def test_dropwhile?


          arr1 = Array.new
          arr1<<@test1.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [[]], arr1


          arr2 = Array.new
           arr2<<@test2.my_dropwhile{|i| i.is_a?(Integer)}

          assert_equal [['s','d','f']], arr2

          arr3 = Array.new
          arr3<<@test3.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [[nil,nil,nil]], arr3


          arr4 = Array.new
          arr4<<@test4.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [[nil,3]], arr4

          arr5 = Array.new
          arr5<<@test5.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [['s',nil,'f']], arr5


          arr6 = Array.new
          arr6<<@test6.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [[nil,'d']], arr6

          arr7 = Array.new
          arr7<<@test7.my_dropwhile{|i| i.is_a?(Integer)}
          assert_equal [['g']], arr7

  end


  def test_dpwhile

     assert_equal [], @test1.my_dropwhile.to_a
     assert_equal [], @test2.my_dropwhile.to_a
     assert_equal [], @test3.my_dropwhile.to_a
     assert_equal [], @test4.my_dropwhile.to_a
     assert_equal [], @test5.my_dropwhile.to_a
    assert_equal [], @test6.my_dropwhile.to_a
    assert_equal [], @test7.my_dropwhile.to_a
  end


   # def test_eachcon
   #
   #   arr1 = Array.new
   #   @test1.my_cons(2){|a| arr1<< a}
   #    assert_equal [[1,2],[2,3]], arr1
   #
   #   arr2 = Array.new
   #   @test2.my_cons(2){|a| arr2<<a}
   #   assert_equal [['s','d'],['d','f']], arr2
   #    # assert_equal [[1,2][2,3]], arr1
   # end

  def test_eachc
    arr1 =Array.new
    arr1<<@test1.my_eachcons(2).to_a
    assert_equal [[[1,2],[2,3]]],arr1.to_a

    arr2= Array.new
    arr2<<@test2.my_eachcons(2).to_a
    assert_equal [[['s','d'],['d','f']]],arr2
  end


  def test_entry
    assert_equal [1,2,3], @test1.my_entry.to_a
    assert_equal ['s','d','f'], @test2.my_entry.to_a

  end


  def test_slice
    arr= Array.new
    @test1.each_slice(2){|a| arr<<a}
     assert_equal [[1,2],[3]], arr

  end



  def test_withindex
    hash = Hash.new
    assert_equal ['s','d','f'], @test2.my_eachwithindexj{|item, index| hash[item]=index}

  end

  
  def test_withindex2
    hash = Hash.new
    assert_equal [['s',0],['d',1],['f',2]], @test2.my_eachwithindexj
  end



  def test_withobj
    arr = Array.new
    arr<< (@test1.my_eachwithobj{|i,a| a<<i*2})
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
   assert_equal [1,2,3], @test1.my_entries
  end


  def test_find
    assert_equal 1,@test1.my_find{|i| i.is_a?(Integer)}
  end

  def test_find1

    assert_equal [1,2,3],@test1.my_find.to_a
  end


  def test_findall
    assert_equal [1,2,3], @test1.my_findall{|i| i.is_a?(Integer)}
  end


  def test_findall1
    assert_equal [1,2,3], @test1.my_findall.to_a
  end

  def test_findindex
    assert_equal 0, @test1.my_findindex{|i| i.is_a?(Integer)}
  end

  def test_findindex1
    assert_equal 1, @test2.my_findindex('d')
  end

  def test_findindex2

     assert_equal [1,2,3],@test1.my_findindex.to_a
  end


  def test_first
    assert_equal ['s'], @test2.my_first(1)
  end



  def test_first1
    assert_equal 1, @test1.my_first
  end

  def test_map
    assert_equal [1,-1,2,-2,3,-3], @test1.my_flatmap{|e| [e,-e]}
  end

  def test_grep
    assert_equal @test1.my_grep(1),[1]
  end

  def test_grep_v
    assert_equal @test1.my_grepv(1),[2,3]
  end

  def test_group_by
    assert_equal @test1.getter.group_by{|x|x%2==0},{false=>[1, 3], true=>[2]}
  end

  def test_include?
    assert_equal @test1.my_include(1),true
  end

  def test_inject

    assert_equal @test1.my_inject(0){|sum, n| sum+n},6
  end

  def test_lazy

    assert_equal @test1.my_lazy.to_a,[1,2,3]
  end

  def test_map
    assert_equal @test1.my_map{|x|x*2},[2,4,6]
  end

  def test_max
    assert_equal @test1.my_max,3
  end

  def test_maxby
    assert_equal  3 , @test1.my_maxby{|x| x }
  end

  def test_member?
    assert_equal @test1.my_member(1),true
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
    assert_equal @test1.my_none{|x|x<1},true
  end

  def test_one?
    assert_equal @test1.my_once{|x|x>1},false
  end

  def test_partition
    assert_equal @test1.my_partition{|x|x>1},[[2,3],[1]]
  end

  def test_reduce
    assert_equal @test1.reduce(:+),6
  end

  def test_reject
    assert_equal @test1.my_reject{|x|x%2==0},[1,3]
  end

  def test_reserve
    assert_equal @test1.my_reverse.to_a,[3,2,1]
  end

  def test_select
    assert_equal @test1.my_select{|x|x%2==0},[2]
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
    assert_equal @test1.my_sort,[1,2,3]
  end

  def test_sortby
    assert_equal @test1.my_sortby{|x|x},[1,2,3]
  end

  def test_sum
    assert_equal @test1.my_sum,6
  end

  def test_take
    assert_equal @test1.my_take(1),[1]
  end

  def test_to_a
    assert_equal @test1.my_toa,[1,2,3]
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
    assert_equal @test1.my_zip(a).to_a,[[1,0],[2,0],[3,0]]
  end
  def test_detect?
    assert_equal 2, @test1.my_detect{|x|x%2==0}
  end

  #
  #







end
