`gem install time_out`

```ruby
require 'time_out'

TimeOut.set_timeout(-> () {
  puts "World"
}, 10)

i = 0
interval = TimeOut.set_interval(-> () {
  i += 1
  puts i
}, 1)

TimeOut.set_timeout(-> () {
  puts "Awesome"
}, 5)

TimeOut.set_timeout(-> () {
  TimeOut.clear_interval(interval)
}, 20)

puts "Hello"
sleep 15
puts "!!!"

TimeOut.wait_for_intervals
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
