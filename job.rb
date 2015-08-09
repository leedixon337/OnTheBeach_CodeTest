class Job
def job_sorter(string_plus_dependencies ={})
  answer = ""
    string_plus_dependencies.each do|k, d|              # k = key,   d = depenencies
      if k == d                                           #if k is the same as d
        return "Error: Jobs cannot depend on themselves!" #that job depends on itself, so return an error
      elsif d == "" && answer.rindex(k)!=nil              #if key has NO dependencies but has already been sorted, no nothing.
      elsif d != "" && answer.rindex(k)!=nil              #if key HAS dependencies but that KEY has already been sorted
        position = answer.rindex(k)                       #    | find rindex of the current version of key thats already been listed
        answer.slice! "#{k}"                              #    | remove the version of key that's already in the answer
        answer.insert(position, "#{d + k}")               #    | concat into key's previous position d followed by k
      elsif d != "" && answer.rindex(d)!=nil              #if key HAS dependencies but that DEPENDANCY has already been sorted
        position = answer.rindex(d)                       #    | locate the index position of the already positioned d
        answer.slice! ("#{d}")                            #    | removed the soon to be duplicated depenance
        answer.insert(position, "#{d + k}")               #    | concat into d's previous position d followed by k
      elsif d != ""                                       #if key has dependencies but neither the k or d have been sorted yet
        answer.concat("#{d + k}")                         #    | concat d followed by k into answer
      else
    answer.concat(k)                                      #if none of the above statements are true concat k onto answer
    end
  end
  answer.chars.each do |c|                                    #for each character in answer
    if answer.count(c) !=1                                    #  | look up how many times that character appears in the answer
      return "Error: Jobs cannot have circular dependencies!" #  | if it appears anything other then once, we have a circular dependancy so return error
    end
  end

answer  #returns answer as long as everything passes
 end #job_sorter end
end #job class end
