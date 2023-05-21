println("hello world")

function sum(x)
    sum = 0
    for i in x
        sum += i
    end
    return sum
end

println(sum([1,2,3,4,5]))

function sum_integers(list::Vector{Int})
    total::Int = 0
    for j::Int in list
        total += j
    end
    return total
end

println(sum_integers([1,2,3,4,5]))

using Pkg
# Pkg.add("Spark")
Pkg.add(path="./Spark.jl")
using Spark


Spark.init()
spark = SparkSession.builder.appName("Main").master("local").getOrCreate()
df = spark.createDataFrame([["Alice", 19], ["Bob", 23]], "name string, age long")
df.show()
rows = df.select(Column("age") + 1).collect()
for row in rows
    println(row[1])
end
