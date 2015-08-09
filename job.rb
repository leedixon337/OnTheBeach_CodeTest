class Job
def job_sorter(string_plus_dependencies ={})
  answer = ""
    string_plus_dependencies.each do|job, dependency|           # k = key,   d = depenencies
      if job == dependency                                      #if k is the same as d
        return "Error: Jobs cannot depend on themselves!"       #that job depends on itself, so return an error
      elsif dependency == "" && answer.rindex(job)!=nil         #if key has NO dependencies but has already been sorted, no nothing.
      elsif dependency != "" && answer.rindex(job)!=nil         #if key HAS dependencies but that KEY has already been sorted
        position = answer.rindex(job)                           #    | find rindex of the current version of key thats already been listed
        answer.slice! job                                       #    | remove the version of key that's already in the answer
        answer.insert(position, dependency + job)               #    | concat into key's previous position d followed by k
      elsif dependency != "" && answer.rindex(dependency)!=nil  #if key HAS dependencies but that DEPENDANCY has already been sorted
        position = answer.rindex(dependency)                    #    | locate the index position of the already positioned d
        answer.slice! (dependency)                              #    | removed the soon to be duplicated depenance
        answer.insert(position, dependency + job)               #    | concat into d's previous position d followed by k
      elsif dependency != ""                                    #if key has dependencies but neither the k or d have been sorted yet
        answer.concat(dependency + job)                         #    | concat d followed by k into answer
      else
    answer.concat(job)                                          #if none of the above statements are true concat k onto answer
    end
  end
  answer.chars.each do |character|                              #for each character in answer
    if answer.count(character) !=1                              #  | look up how many times that character appears in the answer
      return "Error: Jobs cannot have circular dependencies!"   #  | if it appears anything other then once, we have a circular dependancy so return error
    end
  end

answer    #returns answer as long as everything passes
  end     #job_sorter end
end       #job class end
