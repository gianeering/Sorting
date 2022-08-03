#Author: Gianfranco Ponza, a.k.a GianProgrammer, gianeering, innerRot
#© 2022 Gianfranco Ponza. All rights reserved.

module Sorting
    export isort!,ssort!,bsort!,msort!,ren!

    """
    Insertion sort algorithm
    """
    function isort!(T::AbstractVector)
    	for j in 2:length(T)
    		rec = T[j]
    		i = j-1
    		while i>0 && T[i] > rec
    			T[i+1] = T[i]
    			i -= 1
    		end
    		T[i+1] = rec
    	end
    	return T
    end


    """
    Selection sort algorithm
    """
    function ssort!(T::AbstractVector)
    	for i in 1:length(T)-1
    		min = i
    		for j in i+1:length(T)
    			T[min] > T[j] ? min = j : nothing
    		end
    		T[i],T[min] = T[min],T[i]
    	end
    	return T
    end


    """
    Bubble sort algorithm
    """
    function bsort!(T::AbstractVector)
    	for _ in 1:length(T)
    		for j in 1:length(T)-1
    			if T[j] > T[j+1]
    				T[j],T[j+1] = T[j+1],T[j]
    			end
    		end
    	end
    	return T
    end

    """
    Merge-sort algorithm
    """
    function msort!(T::AbstractVector)

    	if length(T) <= 1
    		return T
    	end

    	mid = div(length(T),2)
    	lpart = msort!(T[1:mid])
    	rpart = msort!(T[mid+1:end])
    	out = similar(T)
    	i = ri = li = 1

    	while li <= length(lpart) && ri <= length(rpart)
    		if lpart[li] <= rpart[ri]
    			out[i] = lpart[li]
    			li+=1
    		else
    			out[i] = rpart[ri]
    			ri+=1
    		end
    		i+=1
    	end

      li <=length(lpart) ? copyto!(out,i,lpart,li) : copyto!(out,i,rpart,ri)
    	return out
    end

    """
    This function recursively iterates through each item to find array's length
    It is very inefficient, with time complexity of O(n^n)
    """
    function ren!(T,k=1,mbuf = 0)
      if k<2
        mbuf = tuple(T...,nothing)
      end

      if mbuf[k] == nothing
        return k-1
      end

      ren!(T,k+1,mbuf)

    end
end
