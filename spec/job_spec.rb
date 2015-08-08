require_relative "../job.rb"


describe Job, "0" do
  it "should return an empty string when passed an empty job list" do
    job = Job.new
    expect(job.job_sorter({})).to eq("")
  end
end

describe Job, "1" do
  it "should return the single job when passed a single job with no dependencies" do
    job = Job.new
    expect(job.job_sorter({"a" => ""})).to eq("a")
  end
end

describe Job, "2" do
  it "should return a job list including abc in no specific order" do
    job = Job.new
    expect(job.job_sorter({"a" => "", "b" => "", "c" => ""})).to eq("abc")
  end
end

describe Job, "2.a" do
  it "should return a job list including abc in no specific order" do
    job = Job.new
    expect(job.job_sorter({"c" => "", "b" => "", "a" => ""})).to eq("cba")
  end
end

describe Job, "3" do
  it "should return a job list consisting of acb where c comes before b" do
    job = Job.new
    expect(job.job_sorter({"a" => "", "b" => "c", "c" => ""})).to eq("acb")
  end
end

describe Job, "4" do
  it "should return a job where the orders c > b, f > c, a > d, b > e are followed" do
    job = Job.new
    expect(job.job_sorter({"a" => "", "b" => "c", "c" => "f", "d" => "a", "e" => "b", "f" => ""})).to eq("adfcbe")
  end
end

describe Job, "5" do
  it "should return an error if a job relies on itself" do
    job = Job.new
    expect(job.job_sorter({"a" => "", "b" => "", "c" => "c"})).to eq("Error: Jobs cannot depend on themselves!")
  end
end

describe Job, "6" do
  it "should return an error if it encounters a circular depenancy" do
    job = Job.new
    expect(job.job_sorter({"a" => "", "b" => "c", "c" => "f", "d" => "a", "e" => "", "f" => "b"})).to eq("Error: Jobs cannot have circular dependencies!")
  end
end
