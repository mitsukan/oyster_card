# Week 2: Oystercard

### Day 1: Dan Tooke and Jihin

#### Challenge 1: Creating a Gemfile

What is a Gemfile?

We create this in our repo to specify where the ruby gems are made, and what we require.

Specified gem source.

Specified ruby version.

Added rspec to test and development groups.

We also included simple coverage gem.


#### Challenge 2: Create RSpec conventional files

We ran `rspec --init` to create the conventional files. We then made the `lib` directory and `touch`ed a file. We created a `describe` block in the `oystercard_spec.rb` file.

#### Challenge 3: Review debugging process

The error thrown is a `NameError`.
The filepath is `# ./spec/oystercard_spec.rb`.
The error occured on line 1.
The error is raised when a given name is invalid or undefined.
We can create the class in the file to fix the `NameError`.

### Day 2: Jihin and Jordan

#### Diagramming practice

We went into quite a lengthy discussion while working on a theoretical scenario where we had to draw out a plan for this oystercard exercise. I preferred to go for a focus on the higher level logic planning while Jordan favoured a detailed planning approach.
We asked Eddie the coach to help us weigh up on our discussion, and he pointed out that more of often than not, there needs to a compromise agreed between two people with two different approaches. There is also a time scale consideration as well. If a client gives a very small time frame and a specific specification, it might be better for a programmer that has no say in a scenario to simply implement based on the user specifications, and let the user deal with the consequences of unexplored scenarios.

#### Challenge 4: Add the balance

I wrote a spec test for a way to store the balance, and passed it by making a method returning `0`. I then deleted this and replaced it with an instance variable and `attr_reader`.

#### Challenge 5: Enable top_up

The next tests runs `.top_up` on subject and returns an increase in value, in this case: `10`.

### Day 3: Jihin and Gabriel

#### Challenge 6: Enforce maximum balance

Wrote a test to look for an error raised if the balance exceeds the £90 cap that has been set in the exercise.

We had an interesting dicussion in regards to the RSpec syntaxing, and the differences with the old `should be` lines vs `expect`. Ideally we would be looking to use `expect` instead of should.

#### Challenge 7: Deducting money

Taking similar testing methodology for the `top_up` method, we implemented and passed the `deduct` method.

#### Challenge 8: Touch in and out

Added a test in the class to check for the `@in_journey` tracker.
Testing the method `in_journey` that returns the instance variable.
Testing the methods `touch_in` and `touch_out`, calling `subject.in_journey?`and testing the return boolean.

#### Challenge 9: Checking minimum balance for touch in

Added testing for a raise error if top up exceeds max.
Implemented a constant to have a minimum spend.


### Day 4: Jihin, Sam and Louis

#### Challenge 10: Charging for the journey

Added a MINBAL constant, made the deduct method a private one.

#### Challenge 11: Saving entry station

Added station_entry, modified touch_in and touch_out to meet specs.

#### Challenge 12: Journey history

Firstly created a `journey_history` array that's saved as an instance variable, with the `attr_reader` for it. Followed the instructions to refactor the touch_out method.

Used a test to check for a default empty `journey_history` array.

Used a test to expect `journey_history` to contain the require hash into the array.

Implemented code to satisfy the tests written.

#### Challenge 13
