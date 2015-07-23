
def shuffle_new(arr)
  out=[]
  until arr.nil?
    num = get_random(0, arr.length-1)
    out << arr[num]
    arr.delete_at(num)
    # arr.push(arr.delete_at(get_random(0, arr.length-1)))
  end
  out
end


def shuffle_new2(arr)
  arr.sort_by {rand}
end


shuffle_new([1,2,3,4,5])