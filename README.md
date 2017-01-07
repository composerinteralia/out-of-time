```ruby
Timer.set_timeout(-> () {
  puts "World"
}, 10)

i = 0
interval = Timer.set_interval(-> () {
  i += 1
  puts i
}, 1)

Timer.set_timeout(-> () {
  puts "Awesome"
}, 5)

Timer.set_timeout(-> () {
  Timer.clear_interval(interval)
}, 20)

puts "Hello"
sleep 15
puts "!!!"

Timer.wait_for_intervals
```

outputs:

```
Hello
1
2
3
4
Awesome
5
6
7
8
9
World
10
11
12
13
14
!!!
15
16
17
18
19
20
```
