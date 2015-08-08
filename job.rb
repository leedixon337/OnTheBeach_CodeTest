class Job
def job_sorter(string_plus_dependencies ={})
  answer = ""
  sort = ""
    string_plus_dependencies.each do|k, d|              # k = key,   d = depenencies
      if k == d
        return "Error: Jobs cannot depend on themselves!"

      elsif d == "" && sort.rindex(k)!=nil                 #if it has no dependencies but has already been sorted, no nothing.
      elsif d != "" && sort.rindex(k)!=nil              #if i HAS dependencies but has already been sorted
        position = answer.rindex(k)
        sort_position = sort.rindex(k)
        answer.slice! "#{k}"
        answer.insert(position, "#{d + k}")
        sort.slice! "#{k}"
        sort.insert(sort_position, "#{d + k}")
      elsif d != "" && answer.rindex(d)!=nil            #if key has a dependancy but that depenancy has been sorted
        position = answer.rindex(d)                     #locate the correct index position to place the new key
        answer.slice! ("#{d}")                          #removed the soon to be duplicated depenance
        answer.insert(position, "#{d + k}")             #place the new key/depenance in the correct location
        sort_position = sort.rindex(d)
        sort.slice! "#{d}"
        sort.insert(sort_position, "#{d + k}")
      elsif d != ""                                     #(added task 3)unless it has no dependencies
        answer.slice! "#{k}"
        answer.concat("#{d + k}")
        sort.concat("#{d + k}")
      else
    answer.concat(k)
    sort.concat(k)
    end
  end
  answer.chars.each do |c|
    if answer.count(c) !=1
      return "Error: Jobs cannot have circular dependencies!"
    else
      answer #returns answer as long as everything passes
    end
  end

 answer #returns answer as long as everything passes
 end #job_sorter end
end #job class end



#job_one = Job.new
#job_one.job_sorter({"a" => "", "b" => "c", "c" => "f", "d" => "a", "e" => "", "f" => "b"})
