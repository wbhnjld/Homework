
 module WangEnumerable
    def my_all
    a = true

     each do |i|
       a=yield i
         if a==false
           return a
         end


     end
      a
  end



  def my_any
    result = true

    each do |i|
       result = yield i
         if result == true
           return result
         end

         end
    return false
  end


    def my_chunk
      result1=yield first
      arr=Array.new
      arr1=Array.new
      each do |i|
        result2=yield i
        if result1==result2
          arr1<<i
        else
          arr<<[result1,Array.new(arr1)]
          arr1.clear
          arr1<<i
          result1=result2
        end
      end
      arr<<[result1,Array.new(arr1)]
    end



   def my_collect

     arr = Array.new

     if
         each do |i|
             a = yield i
             arr<< a

              end

       return arr
  end


   end







   def my_count (position = nil, &blk)

     length = 0


     if position==nil
       if blk
         each do |i|

           a = yield i

           if a == true
             length = length + 1
           end
         end

         return length

       else
           each do |i|
             length = length + 1
           end
       end



     else
       each do |i|
         length = length + 1
         if position == length
           return i
         end
       end
     end
   end



  def my_cycle (number)

    for a in 1..number

      arr = Array.new
        each do |i|
           a = yield i
           arr << a
         end


    end

    arr

  end


   def my_detect
     each do |i|

     a = yield i
      if(a==true)

       return i


     end

    end
   end


   def my_drop (number)

     arr = Array.new
     length = 0
     each do |i|
       length = length +1
       if length > number
         arr<<i
       end
     end

   end





    def my_dropwhile
      unless block_given?
        return
      end
      arr=Array.new
      length=0
      flag=0

      each do |i|
        puts i
        if (yield i) ==true && flag==0
          length=length+1
        else
          flag=1
          arr<<i
          length=length+1
        end

      end

      arr

    end


   def my_cons  (num)
     arr = Array.new
     hash = Hash.new()
     position = 1
     each do |i|

       hash = {position => i}

       position = position + 1
     end

     arr
   end



   def my_entry (&blk)
     arr = Array.new
     if blk
       each do |i|
         a = yield i
         arr<<a
       end


     else
       each do |i|
         arr<<i
       end
     end

      arr
   end


   def my_eachwithindexj (&blk)
     arr = Array.new
     arr1 = Array.new
     j = 0
     b=0

     if blk
       each do |i|

         a = yield i,j
         j+=1

         arr<<i
       end

     else
       each do |i|
         arr<<i
       end
       c= arr.size
       while b < c do
         arr1[b] = [arr[b],b]
         b = b+1
       end
       arr1
   end

   end

   def my_eachwithobject()
     arr = Array.new
     each do |i|

     end

   end

   def my_entries
     arr = Array.new
     each do |i|
       arr << i
     end
   end



   def my_find (&blk)
     if blk
       each do |i|

         a = yield i
         if(a==true)

           return i


         end

       end
     else
       arr = Array.new
       each do |i|
         arr<< i
       end


     end


   end


   def my_findall (&blk)
     arr = Array.new
     if blk
       each do |i|
         a = yield i
         if a==true
           arr<<i

         end
       end
       arr

     else
       each do |i|
         arr<<i
       end
     end


   end


   def my_findindex (number = nil, &blk)
     position = 0
     arr = Array.new
     if number == nil
       if blk
         each do|i|
           a = yield i
           if a==true
             return position

           else
             position = position + 1
           end

         end
       else
         each do |i|
           arr<< i
         end
       end

     else
       each do |i|
         if i == number
           a = position
           return a
         end
         position = position+1

       end
     end
   end


   def my_first (number = nil)
     arr = Array.new
     position = 1

     if number == nil
       each do |i|
         return i
         break
       end

     else
       each do |i|
         arr<< i
       if number == position
         return arr
         break
       end
         position = position + 1
       end
     end
   end



   def my_flatmap
        arr = Array.new
        each do |i|
          a = yield i
          arr<<a
        end
     return arr
   end


   def my_grep (number)
     arr = Array.new
     each do |i|
       if i==number
         arr<<i
       end
     end
     return arr
   end

   def my_grepv (number)
     arr = Array.new
     each do |i|
       if i != number
         arr<<i
       end
     end
     return arr
   end

 def my_groupby

   hash=Hash.new
   arr=Array.new
   arr1=Array.new

   each do |e|
        arr<<e
      end

   while arr.length>0 do
     length=0

     result=yield arr[length]

     while length<arr.size do
          if (yield arr[length])==result

            arr1<<arr.delete_at(length)
            length=length-1
          end
          length=length+1
        end
        hash[result]=Array.new(arr1)
        arr1.clear
      end
      return hash
    end

   def my_include( number)

     each do |i|
       if i == number
         return true
       else
         return false
       end
     end
   end

   def my_inject (accumulator)
     each do |i|
       accumulator = yield accumulator, i

     end
     accumulator
   end


   def my_lazy
     arr = Array.new
     each do |i|
       arr<<i
     end

   end

   def my_map
     arr = Array.new
     each do |i|
       a = yield (i)
       arr<<a
     end
     return arr
   end


   def my_max (number = nil)
     ini = 0

       each do |i|
         if i > ini
           ini = i
         end
       end
     return ini
   end


   def my_maxby
      ini = 0
      x = 0
    each do |i|
      a = yield i

      if a >= ini
        ini = a
        x= i
      end
    end
    return x
   end



   def my_member (num)
     result = false
     each do |i|
       if i == num
         result=true
       end
     end
     result
   end


   def my_min

     arr = Array.new
     each do |i|
       arr<< i
     end

     (arr.size-2).downto(0) do |i|
       (0..i).each do |j|
         arr[j], arr[j+1] = arr[j+1], arr[j] if arr[j] > arr[j+1]
       end
     end
     return arr[0]
   end


    def my_minby(n=nil)
      if n==nil
        inject{|accumulator,element|(yield accumulator) <= (yield element) ? accumulator:element}
      else
        arr1=Array.new(n)
        each do |e|
          a = 0
          while a < n  do
            if arr1[a]==nil or ((yield e)<(yield arr1[a]))
              i=1
              while n-i>a do
                arr=Array.new(arr1)
                arr1[n-i]=arr[n-i-1]
                i=i+1
              end
              arr1[a]=e
              break
            end
            a=a+1
          end
        end
        arr1
      end
    end

   def my_minmax
     arr = Array.new
     each do |i|
       arr<<i
     end
     (arr.size-2).downto(0) do |i|
       (0..i).each do |j|
         arr[j], arr[j+1] = arr[j+1], arr[j] if arr[j] > arr[j+1]
       end
     end
     arr1 = Array.new
     arr1<<arr[0]
     arr1<<arr[arr.size-1]
     return arr1

   end

    def my_minmaxby
      min=first
      max=first
      each do |i|
        if (yield i)>(yield max)
          max=i
        elsif (yield i)<(yield min)
          min=i
        end
      end
      [min,max]
    end


   def my_none(&blk)
     result = true
     if blk
       each do |i|
         a = yield i
         if a == true
           result = false
         end

       end
     else
       each do |i|
         if i == false
           result = false
         end
       end

     end

     return result

   end


   def my_once(&blk)
     result = false
     flag = 0
     if blk
       each do |i|
         a= yield i
         if a==true
           flag = flag +1
         end
       end

       if flag== 1
         result = true
       end

     else
       each do |i|
         if a == true
           flag= flag +1
         end
       end

       if flag == 1
         result = true
       end
     end
     return result
   end


   def my_partition(&blk)
     arr1 = Array.new
     arr2 = Array.new


     if blk
       each do |i|
         a= yield i
         if a== true
           arr1<<i
         else
           arr2<<i
         end
       end
       arr3 = Array[arr1,arr2]

       return arr3
     end

   else
     each do |i|
       arr1<< i
     end
     return arr1

   end


   def my_reduce (*argv, &block)
       initial=nil
       sym=nil
       if argv[0].is_a?(Numeric)
         initial=argv[0]
       elsif argv[0].nil? == false
         sym=argv[0]
       end

       unless argv[1].nil?
         sym=argv[1]
       end

       if sym==nil
         if initial.nil?
           ignore_first=true
           initial=first
         end
         is_first=true
         each do |i|
           unless is_first && ignore_first
             initial=yield(initial,i)
           end
           is_first=false
         end
       else
         if initial.nil?
           ignore_first=true
           initial=first
         end
         is_first=true
         each do |i|
           unless is_first && ignore_first
             if sym.to_s=='+'
               initial=initial+i
             elsif sym.to_s=='*'
               initial=initial*i
             elsif sym.to_s=='-'
               initial=initial-i
             elsif sym.to_s=='/'
               initial=initial/i
             end
           end
           is_first=false
         end
         initial
       end
     end

   def my_reject(&blk)
     arr = Array.new
     if blk
       each do |i|
         a = yield i
         if a == false
           arr<<i
         end
       end
       return arr
     end
   else
     each do |i|
       arr<<i
     end
     return arr
   end




   def my_reverse
     arr = Array.new
     arr2 = Array.new
     each do |i|
         arr<<i
     end
        aa = arr.size
     while aa != 0 do
       arr2<< arr.pop
       aa = aa-1
     end
       return arr2
   end

   def my_select
     arr = Array.new
     each do |i|
       a = yield i
       if a== true
          arr<< i
       end
     end
     return arr
   end



    def my_sliceafter(n)
      a = 0
      arr=Array.new
      result=Array.new
      each do|i|
        if a ==0 && i!=n
          arr<<i
        elsif i==n
          a=1
          arr<<i
          result<<Array.new(arr)
          arr.clear
        else
          arr<<i
        end
      end
      result<<Array.new(arr)
      result
    end

    def my_slicebefore(n)
      a=0
      arr=Array.new
      result=Array.new
      each do|i|
        if a==0 && i!=n
          arr<<i
        elsif i==n
          result<<Array.new(arr)
          arr.clear
          a=1
          arr<<i
        else
          arr<<i
        end
      end
      result<<Array.new(arr)
      result
    end


    def my_slicewhen
      a=0
      arr=Array.new
      result=Array.new
      each do|i|
        if (a==0) && ((yield i)!=true)
          arr<<i
        elsif yield i
          a=1
          arr<<i
          result<<Array.new(arr)
          arr.clear
        else
          arr<<i
        end
      end
      result<<Array.new(arr)
      result
    end


   def my_sort
     arr = Array.new
     each do |i|
       arr<<i
     end
     b = []
     arr.size.times do |i|
       min = arr.min
       b << min
       arr.delete_at(arr.index(min))
     end
     return b
   end

   def my_sortby
     arr = Array.new
     each do |i|
       a = yield i
       arr << i
     end
     (arr.size-2).downto(0) do |i|
       (0..i).each do |j|
         arr[j], arr[j+1] = arr[j+1], arr[j] if(yield arr[j])  > (yield arr[j+1])
       end
     end
     return arr
   end



   def my_sum (&blk)
     sum = 0
     if blk
       each do |i|
         a = yield i
         sum = sum + a
       end

       return sum

     else

       each do |i|
         sum = sum + i
       end
       return sum
     end
   end



   def my_take (number)
     arr = Array.new
     position = 0
     each do |i|
       if position < number
         arr<<i
         position= position+1
       end
     end
     return arr
   end


   def my_takewhile(&blk)
     if blk
       each do |i|
         a = yield i
         if a== true
           arr<< i
         end

       end

     else
       each do |i|
         arr<<i
       end
     end

    return arr
   end



   def my_toa

      arr= Array.new
          each do |i|
            arr << i
          end
   end


   def my_unique
     arr = Array.new
     each do |i|
       arr<< i
     end




   end

   def my_zip (var)
     arr1 = Array.new

     each do |i|
         arr1<<i
     end
     arr2 = Array.new
     a = arr1.size
     b = 0
     while b<a do
       arr2[b] = [arr1[b], var[b]]
       b = b+1
     end

     return arr2
   end

   def my_eachcons (n)
     arr1 = Array.new
     result = Array.new

     each do |i|
       arr1<<i
     end
     c = arr1.size
     d = 0
    while d <= (c- n) do
      result[d] = [arr1[d], arr1[d+1]]

      d=d+1
    end

     result

   end


   def my_eachwithobj
     arr1 =Array.new
     each do |i|
      (yield i,arr1)

     end

     arr1

   end



    def my_eachslice (n)
      arr1 = Array.new
      result = Array.new

        each do |i|
          arr1 << i
        end

        c = arr1.length
        d = 0


        while d < c do
          i = 0
          arr2 = Array.new
          while i < n && d<c
            arr2 << arr1[d]
            i+=1
            d+=1
          end
          result << Array.new(arr2)
        end

        result
      end

    def my_uniq
      arr=Array.new
      each do |i|
        arr<<i
      end
      a=0
      while a<arr.size-1 do
        m=a+1
        while m<arr.size do
          if arr[a]==arr[m]
            arr.delete_at(m)
          else
            m=m+1
          end
        end
        a+=1
      end
      arr
    end





end

























