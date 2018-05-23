# FastTry <a href='https://travis-ci.org/westonganger/fast_try' target='_blank'><img src='https://api.travis-ci.org/westonganger/fast_try.svg?branch=master' border='0' alt='Build Status' /></a> 

<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 

Ruby 2.3 introduced the safe navigation operator `&.`, however I find that its syntax is too discrete an can be easy to miss when briefly scanning code. Instead I much prefer the syntax of `try` as it seems way more obvious and intentional.

FastTry is a simple method wrapper to the safe navigation operator. By default it is configured as the `try` method.

<u>Features / Goals:</u>

- Utilize the safe navigation operator `&.` while improving readability
- Improve performance over other implementations such as the `ActiveSupport#try` method
- Do not worry about most obscure syntax limitations if they cannot be avoided. Speed and simplicity is key.
- The method provided should behave very similarly to the safe navigation operator. If you need to retain the exact behaviour of ActiveSupport `try`, simply set your own custom method name(s) for FastTry. 
- The only dependency is Ruby 2.3+. It does NOT require Rails /ActiveSupport anything else however it works great with it too!

# Setup

Add the following line to your gemfile:
```ruby
gem 'fast_try', git: 'https://github.com:westonganger/fast_try.git'

## OR if you dont want to use an initializer and default to FastTry.methods = [:try]
gem 'fast_try', require: ['fast_try', 'fast_try/apply'], git: 'https://github.com:westonganger/fast_try.git'
```

If you want change the name(s) of the methods to create/overwrite just add an initializer. If using Rails, simply run `rails generate fast_try:create_initializer`

```ruby
FastTry.method_names = [:try, :custom_try, :try!]

require 'fast_try/apply'
```

# Usage

```ruby
str.try(:upcase).try(:downcase)

# the above statement is now equivalent to using the safe navigation operator Ex.
str&.upcase&.downcase
```

# Known Limitations

Our main goal is speed and simplicity. As such we may not handle some obscure syntax. Please create a PR or Issue if you find a limitation that should be documented here.

- Apparently safe navigation does not work with class methods so this does not either. Ex. `Array&.bad_method` results in `NoMethodError`.

# Differences between FastTry and ActiveSupport#try

It is not our goal to maintain any consistency with the ActiveSupport version of the `try` method. I do however want to maintain a simple list of the differences. Please create a PR or Issue if you find a difference that should be documented here.

- Nothing reported yet

# Credits

Created and Maintained by [Weston Ganger - @westonganger](https://github.com/westonganger)

Implementation originally based on this StackOverflow answer by <i>engineersmnky</i> on https://stackoverflow.com/questions/50471518/ruby-is-it-possible-to-alias-a-method-to-the-safe-navigation-operator

<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 

# Benchmarks

As tested on master branch. See benchmark: `test/benchmarks.rb`

```
Results when method is found
       user     system      total        real
               FastTry  0.430000   0.020000   0.450000 (  0.456562)
       Safe Navigation  0.070000   0.000000   0.070000 (  0.069512)
     ActiveSupport try  0.860000   0.100000   0.960000 (  0.959851)
         Check for nil  0.070000   0.000000   0.070000 (  0.074626)
           respond_to?  0.230000   0.020000   0.250000 (  0.239758)
                rescue  0.060000   0.000000   0.060000 (  0.063295)
  Calculating -------------------------------------
               FastTry    80.000M memsize (     0.000  retained)
                           2.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
       Safe Navigation     0.000  memsize (     0.000  retained)
                           0.000  objects (     0.000  retained)
                           0.000  strings (     0.000  retained)
     ActiveSupport try   200.000M memsize (     0.000  retained)
                           5.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
         Check for nil     0.000  memsize (     0.000  retained)
                           0.000  objects (     0.000  retained)
                           0.000  strings (     0.000  retained)
           respond_to?    40.000M memsize (     0.000  retained)
                           1.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
                rescue     0.000  memsize (     0.000  retained)
                           0.000  objects (     0.000  retained)
                           0.000  strings (     0.000  retained)

  Results when method is not found
         user     system      total        real
               FastTry  0.230000   0.000000   0.230000 (  0.227693)
       Safe Navigation  0.060000   0.000000   0.060000 (  0.065258)
     ActiveSupport try  0.300000   0.000000   0.300000 (  0.292541)
         Check for nil  0.060000   0.000000   0.060000 (  0.063945)
           respond_to?  0.240000   0.000000   0.240000 (  0.245455)
                rescue  3.580000   0.000000   3.580000 (  3.575365)
  Calculating -------------------------------------
               FastTry    80.000M memsize (     0.000  retained)
                           2.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
       Safe Navigation     0.000  memsize (     0.000  retained)
                           0.000  objects (     0.000  retained)
                           0.000  strings (     0.000  retained)
     ActiveSupport try   120.000M memsize (     0.000  retained)
                           3.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
         Check for nil     0.000  memsize (     0.000  retained)
                           0.000  objects (     0.000  retained)
                           0.000  strings (     0.000  retained)
           respond_to?    40.000M memsize (     0.000  retained)
                           1.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
                rescue     2.640B memsize (     0.000  retained)
                           6.000M objects (     0.000  retained)
                           1.000  strings (     0.000  retained)
```
