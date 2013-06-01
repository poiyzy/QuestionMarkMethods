# QuestionMarkMethods

[![Code Climate](https://codeclimate.com/github/poiyzy/QuestionMarkMethods.png)](https://codeclimate.com/github/poiyzy/QuestionMarkMethods)

I love the attribute query methods in ActiveRecord, Query methods allow me to check whether an attribute value is present. For example:

```ruby
user = User.new(:name => "David")
user.name? # => true

anonymous = User.new(:name => "")
anonymous.name? # => false
```

I love the question mark at the end of the method name, because it makes the code more readable. But what should we do if we do not use ActiveRecord? Also you can implement it like below:

```ruby
class User
  #initialize method...

  def is_admin?
    @is_admin
  end
end
```

But I am tired of this, all I need is just adding a question mark at the end of the method name, so I build this gem to reduce that codes.

## Installation

Add this line to your application's Gemfile:

    gem 'question_mark_methods'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install question_mark_methods

## Usage

First, Include it in your class

```ruby
require 'QuestionMarkMethods'

class User
  include QuestionMarkMethods
end
```

and then use it just like attribute query methods in ActiveRecord. For example

```ruby
class User
  include QuestionMarkMethods

  def initialize(name, is_charged)
    @name = name
    @is_charged = is_charged
  end
end

user = User.new("alice", true)
user.is_charged? # => true
user.name? # => true
```

**You can also customize your method names**

Add a macros `add_question_mark_methods`:

```ruby
class User
  #...

  add_question_mark_methods has_a_name?: :name, has_been_charged?: :is_charged

  #instance methods...

end

user = User.new("alice", true)
user.has_a_name? # => true
user.has_been_charged? # => false
```

**Why don't use alias_method()?**

let's look at how to use alias_method to implement this.

```ruby
class User
  attr_reader :is_charged, :name

  alias_method :has_been_charged?, :is_charged
  alias_method :has_a_name?, :name

  #same initialize...
end

user = User.new("alice", true)
user.has_been_charged? # => true
user.has_a_name? # => "alice"
```

When we using alias_method to do the same thing, We need to add `attr_reader` first and use `alias_method` twice to define two aliases. Maybe you have noticed the biggest problem, `user.has_a_name?` returns the value of @name, but we need a boolean.

## About

I built this for fun and practicing metaprogramming, after finishing the mid-level course of [Tealeaf Academy](http://gotealeaf.com).

Thanks @knwang!
