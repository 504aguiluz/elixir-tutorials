# elixir-tutorials
>https://codestool.coding-gnome.com/enrollments

## Getting Started
### IEX
> in command prompt: 
> iex -> to open
> ^C^C -> to close
> IO.puts -> writes "item" to the given "device" and adds a newline at the end
>       By default, device is the standard output. It returns :ok if it succeeds
>
>IO.<function name> allows you to call functions
>h IO.<beginning letter of function + TAB(x2)> -> gives you a list of all autocompleted functions after the last letter you typed
>
>h IO. -> shows a list of ALL functions
>
>v(<number of compiled call>) -> returns the value of that specific call
>
>to get out of ... mode, type #iex:break

## Our First Project
###
>to create a new component/project/application:
>mix new <name of component/project/application>
>
>to test:
>mix test
>
>to compile*:
>mix compile
>*fyi, this must be used in the top-level dir of the app (the one containing the mix.exs file)
>
>to see what mix functions you can call:
>mix helpmix 
>
>
>## General options
>
>  -e "COMMAND"                 Evaluates the given command (*)
>  -h, --help                   Prints this message (standalone)
>  -r "FILE"                    Requires the given files/patterns (*)
>  -S SCRIPT                    Finds and executes the given script in $PATH
>  -pr "FILE"                   Requires the given files/patterns in parallel (*)
>  -pa "PATH"                   Prepends the given path to Erlang code path (*)
>  -pz "PATH"                   Appends the given path to Erlang code path (*)
>  -v, --version                Prints Erlang/OTP and Elixir versions (standalone)
>
>  --app APP                    Starts the given app and its dependencies (*)
>  --erl "SWITCHES"             Switches to be passed down to Erlang (*)
>  --eval "COMMAND"             Evaluates the given command, same as -e (*)
>  --logger-otp-reports BOOL    Enables or disables OTP reporting
>  --logger-sasl-reports BOOL   Enables or disables SASL reporting
>  --no-halt                    Does not halt the Erlang VM after execution
>  --short-version              Prints Elixir version (standalone)
>  --werl                       Uses Erlang's Windows shell GUI (Windows only)
>
>
## Distribution options
>
>The following options are related to node distribution.
>
>  --cookie COOKIE              Sets a cookie for this distributed node
>  --hidden                     Makes a hidden node
>  --name NAME                  Makes and assigns a name to the distributed node
>  --rpc-eval NODE "COMMAND"    Evaluates the given command on the given remote node (*)
>  --sname NAME                 Makes and assigns a short name to the distributed node
>
>
## Release options
>
>The following options are generally used under releases.
>
>  --boot "FILE"                Uses the given FILE.boot to start the system
>  --boot-var VAR "VALUE"       Makes $VAR available as VALUE to FILE.boot (*)
>  --erl-config "FILE"          Loads configuration in FILE.config written in Erlang (*)
>  --pipe-to "PIPEDIR" "LOGDIR" Starts the Erlang VM as a named PIPEDIR and LOGDIR
>  --vm-args "FILE"             Passes the contents in file as arguments to the VM
>
>--pipe-to starts Elixir detached from console (Unix-like only).
>It will attempt to create PIPEDIR and LOGDIR if they don't exist.


### Start Coding
>iex -S mix in terminal is the way to go. It runs mix before CLI.
>
>after you make changes, you can either:
>do the tedious way:
>c "lib/dictionary.ex" --> compiles the app to the exact location
>
>OR
>
>do the slightly less tedious way:
>r Dictionary  --> recompiles the app

You can group a chunk of Elixir code between the keywords do and end. This is used in our example to delineate the body of our module, and the bodies of the function it contains:

>defmodule Dictionary do
>
>  --> body of module . . .
>
>  def hello() do
>
>    --> body of function . . .
>
>  end
>
>end





-modules in Elixir are defined using defmodule followed by the module name and a do/end block.

-functions are defined using def followed by the function name, any parameters, and the body in a do/end block.

-module names must be an Elixir atom. Conventionally we use Capitalized words (MyFirstModule). There's a section about atoms later in this chapter.

-function names are either names or one of the Elixir operators. Names must start with a lowercase letter or underscore, and may contain letters, digits, and underscores. The name may end with an exclamation point or a question mark.

-IO.puts writes a string to standard output.


## Start Writing the Dictionary
>File.read!("assets/words.txt") --> fn that lists all the words in the chosen directory
>
>File. + [TAB] -> shows all fns for File
>
>Created an assets directory in our project and download words.txt into it.
>
>Went into iex, and typed File.↦ (where ↦ represents the tab character). Tab completion displayed the list of File functions, and we use h File.read to get help.
>
>We chose File.read! to read the wordlist and String.split to break it into a list of words.
>
>We combined the two into a function, Dictionary.word_list, and played with it in iex.
>
>We also saw examples of tuples and regular expression literals. We'll look at these in more detail in the next chapter.
>
>Strings Can Be Called Binaries
>
>Erlang uses sequences of bytes to represent strings. It considers this just another byte stream—binary data—and so calls these values binaries. This convention carries forward into Elixir, so don't be surprised to see the word binary where you were expecting string.
>
>Function Names Ending With An Exclamation Mark
Often Elixir has two variants of a function, such as File.read and File.read!. Most of the time this means that the plain version will return an error status on failure, and the version with the shriek will raise an exception. This rule isn't universal, though, so check the documentation.
>
>Functions Are Identified By Name/Arity
>
>Elixir functions have a name (by convention lowercase letters, digits, and underscores, with a possible trailing ? or !). They also have an arity: the number of parameters they take.
>
>Both the name and the arity are required to identify a particular function. We write the combination as name/arity: String.split/1, String.split/2 and so on.
>
>Values Are Not Objects
>In an object-oriented language, an object is typically associated with a class or a prototype. That class defines the methods that are supported by the object. In Ruby, for example, we could split a string using:
>
>"123\n456\n789\n".split(/\n/)
>Values in Elixir have a type, but the type does not attach functions to those values. Instead, you pass the value as a parameter to the appropriate function:
>
>String.split("123\n456\n789\n", ~r/\n/)
When I first started using Elixir, I hated this. It seemed as if I had lost the fact that (say) strings had string-like behaviors.
>
>But the more I coded in Elixir, the more I came to realize that this association between a value and a set of methods actually represented a very strong form of coupling, and that this coupling had made my OO code brittle.
>
>It takes getting used to, but I think you'll come to the same conclusion.
>
>Functions Return The Last Expression Evaluated
>Functions exit by falling out the bottom—there is no explicit return keyword.
>
>Finding Functions
>Although types don't have associated functions, you'll find that the libraries in Elixir use naming conventions to make finding appropriate functions easier. For example, a string will typically be manipulated by functions in the String module (String.split and so on). Similarly, lists are manipulated by functions in the List module.
>
>Sometimes a set of functions applies to values of multiple types. For example, lists and maps are both collections of values—they can be enumerated. Functions to do with this shared behavior are in their own module (in this case Enum).
>
>
>Module Attributes (i.e., @word_list)
>- compiles and initializes variable from file once compiled, but after just uses variable to save having to recompile the source file. Super powerful
>
>Pipeline operator: |>
> takes expression to its left and injects it as a parameter to the fn on its right
>
>


# DATA TYPES
## INTEGERS AND FLOATS
> integers greater than 999 use _ instead of , to group
>e.g., 120,000 -> 120_000
>
>Also:
>x -> hexidecimal
>o -> octal
>b -> binary

>iex> 8/3
>2.6666666666666665

### DIV -> returns truncated int result
>iex> div(8, 3)
>2
### TRUNC -> returns truncated int result
>iex> trunc(8/3) 
>2
### ROUND -> returns rounded int result
>iex> round(8/3)
>3

### String.to_integer
> converts string to integer

### Atoms
> Atoms are constants that are used to name things. 
>In a way they are just like strings—the difference is in the representation.

> The first way to create an atom is to prefix a name or an operator with a colon.
> examples ->
> 1.)
> :cat   :puppy_dog    :>=
> 2.)
>:"cat-dog"   :"now is the time"   :"!@$%^&UIO"
>3.)
> iex> a = 99
> 99
> iex> :"next-number: #{a+1}"
> :"next-number: 100"

>The second way to create an atom is to use a name that starts with an uppercase letter.
> iex> is_atom(Dictionary)
> true
> iex> Dictionary == :"Elixir.Dictionary"
> true

### Ranges
> First, they are used with the in operator to check that an integer falls between two bounds:
> iex> a = 5..10
> 5..10
> iex> b = 8..3
> 8..3
> iex> 4 in a
> false
> iex> 4 in b
> true
> iex> for i <- b, do: i*3
> [24, 21, 18, 15, 12, 9]
## Sigils and Strings
>A sigil is simply a notation for creating values from strings. In the regular expression example, the string was \n and the value created was the corresponding regular expression.
>
>All sigils start with the tilde character, ~. This is followed by a single letter, which determines the type of value to be generated. Next comes the string, between delimiters, and finally there may be some optional flags.
>The delimiters can be:
>~r/.../     ~r"..."     -r'...'     ~r|...|
>~r<...>     ~r[...]     ~r(...)     ~r{...}
>~r"""
> :
> :
>"""
>The sigils that come as part of Elixir are:
>Expand	Literal	Meaning
>~c//	~C//	list of character codes
>~r//	~R//	regular expression
>~s//	~S//	string
>~w//	~W//	list of words
## Strings
>An Elixir string is a sequence of Unicode codepoints. They look and behave much like strings in other languages, although they are immutable.
>Backslash expansion and expression interpolation is enabled in double-quoted strings:
>"Name:\t#{name}\nAge:\t#{ trunc(age) }"
>To turn off these substitutions, use the sigil form with an upper case S as the type:
>~S"Name:\t#{name}\nAge:\t#{ trunc(age) }"
>The operator <> concatenates strings, and the functions in the String module manipulate them.

## Regular Expression Literals
>As we've already seen, an Elixir regular expression literal is written using the ~r sigil:
>~r/name:\s*(\w+)/
>The underlying regular expression engine is PCRE.
>
>The Regex module contains most of the functions that work with regular expressions. In addition the operator =~ can perform a regular expression match.
>
>iex> str = "once upon a time"
>"once upon a time"
>iex> str =~ ~r/u..n/
>true
>iex> str =~ ~r/u..m/
>false

>Time to explore the functions in the Regex module:
>Write an expression that returns true if a string contains an a, followed by any character, then a c (so abc, and arc will return true, and ace will not).
>Write an expression that takes a string and replaces every occurrence of cat with dog.
>Do the same, but only replace the first occurrence.
>Possible Solution
>iex> re1 = ~r/a.c/
>~r/a.c/
>iex> "abc" =~ re1
>true
>iex> "arc" =~ re1
>true
>iex> "art" =~ re1
>false
>iex> "cats like catnip" |> String.replace(~r/cat/, "dog")
>"dogs like dognip"
>iex> "cats like catnip" |> String.replace(~r/cat/, "dog", global: false)
>"dogs like catnip"

## Tuples
>A tuple is a fixed-length collection of values. Back when you did geometry in school, you used tuples all the time to group things together: {x,y} and {x,y,z} are both tuples.
>
>Elixir's tuples serve the same function—they group things together. They're more flexible the tuples in math, though, because they can contain values of different types.
>
>Tuple literals are written as a list of expressions between braces:
>
>{ :ok, "wilma" }
>{ :reply, destination, "rain with chance of hail" }
>{ 1, 2, 3+4 }
>Typically tuples are small (two or three elements). They are frequently used to pass flagged values to and from functions. For example, if successful, File.read returns the tuple:
>
>{ :ok, contents }
>The first element is the atom :ok, and the second is the contents of the file.
>
>If instead the file could not be read, File.read would return:
>
>{ :error, reason }
>where reason is an explanation of the failure.

## Lists
> LISTS ARE NOT ARRAYS! They are more like linked lists, actually. 
>An array is a contiguous area of memory containing fixed size cells.

>If you want to find the nth element in a array, you perform some simple address arithmetic:
> a = [123, 456, 789]
> a[2] = 789
> Lists are a sequence of zero of more elements, one linked to the next.
> To get to the third element of the list, you have to start at the first and follow the links.

>However, lists have an extremely useful property. It is easy to add a new element at the head of a list, and equally easy to remove that first element.
>
>This property is reflected in the definition of a list:
>
>Definition: A list is either:
>
>the empty list, written [ ], or
>a value followed by a list, written [ value | list ]
>The value part of the definition is normally called the head of the list, and the rest is called the tail.
>
>Here's how we can build up a list, element by element:
>
>iex> empty = []
>[]
>
>iex> list_3 = [ 3 | empty ]
>[3]
>
>iex> list_2_3 = [ 2 | list_3 ]
>[2, 3]
>
>iex> list_1_2_3 = [ 1 | list_2_3 ]
>[1, 2, 3]
>
>Even though you built the lists as a series of head/tail pairs, IEx displayed the result as a simple list of values.
>
>That's a convention in Elixir. Rather than making you build lists the hard way, you can write them using the conventional comma-separated list of values. But never forget that nonempty lists always have a head, which is a value, and a tail, which is a list.


** Maps
>Some languages call them dictionaries, hashes, or associative arrays. Elixir calls them maps.
>
>iex> countries = %{ 
>...> "BFA" => "Burkina Faso",
>...> "BDI" => "Burundi",
>...> "KHM" => "Cambodia",
>...> "CMR" => "Cameroon",
>...> "CAN" => "Canada",
>...> }
>%{"BDI" => "Burundi", "BFA" => "Burkina Faso", 
>  "CAN" => "Canada",  "CMR" => "Cameroon", 
>  "KHM" => "Cambodia"}
>
>iex> countries["BFA"]
>"Burkina Faso"
>
>iex> countries["XXX"]
>nil
>
>iex> countries[123]
>nil
>Maps are an unordered collection of key/value pairs. Both keys and values can be any Elixir type, and those types can be mixed within a map.
>
>As the example shows, map literals look like
>
>%{ key1 => value1, key2 => value2, . . . }
>You use the functions in the Map and Enum modules to work with maps. In addition, Elixir provides the map[key] shortcut to return the value corresponding to key (or nil).
>
>When the Keys are Atoms
>We often use maps as lookup tables, where the keys are all atoms. For those cases, Elixir has a shortcut syntax.
>
>iex> multipliers = %{ once: 1, twice: 2, thrice: 3 }
>%{once: 1, thrice: 3, twice: 2}
>
>iex> 5 * multipliers[:twice]
>10
>
>iex> 5 * multipliers.twice
>10
>In a map constant, once: 1 is the same as writing :once => 1. And if the map's keys are atoms, you can access the values using the map.key notation.

# Pattern Matching
## The Basics
>Fire up an iex session. (Please)
>
>Type along with me:
>
>iex> a = 1
>See? That was worth it.
>
>What did we just type? The chances are you'd say it was an assignment statement—we assign the value 1 to the variable a. And, indeed, that's what seemed to happen:
>
>iex> a + 1
>2
>But try this:
>
>iex> 1 = a
>No error!
>
>Now try
>
>iex> 2 = a
>** (MatchError) no match of right hand side value: 1
>The secret is that = is not really an assignment operator. Instead, it is a little game that we let Elixir play with our code.
>
>The rules of this game are simple: Elixir has to make the left and right hand sides of the = the same. But, to make it challenging, the only tool Elixir has available is the ability to bind a variable to a value. And because that's not difficult enough, this variable binding can only happen on the left hand side (LHS) of the equals sign.
>
>Let's look again at the expression a = 1.
>
>At the start of the expression, all the variables on the LHS are marked as unbound. Elixir then says "what can I do to make the LHS and RHS equal?". The answer is to bind 1 to a.
>
>Now a has the value 1. When we write b = a, Elixir goes through the same process. b is unbound, and a is 1, so Elixir binds 1 to b.
>
>Then we write 1 = a. There are no unbound variables. But fortunately that doesn't matter, as the LHS and RHS are already equal.
>
>That explains why 2 = a raises an error. Again, there are no unbound variables, so Elixir has no freedom to change anything. The LHS (2) doesn't equal the RHS (1), and there's no way for Elixir to make them equal. It admits defeat with a no match error.
>
>Pattern Matching Works With Structured Data
>Clearly, Elixir thought this game's too easy. Let's level up.
>
>{ a, b } = { "cat", "dog" }
>The LHS and RHS are both two-element tuples. How can Elixir make them equal? By binding "cat" to a and "dog" to b. Go ahead and verify this in iex:
>
>iex> { a, b } = { "cat", "dog" }
>{"cat", "dog"}
>iex> a
>"cat"
>iex> b
>"dog"
>Now try something a little trickier. Type the following into iex:
>
>iex> { a, a } = { "cat", "dog" }
>Did you get an error?
>
>iex> { a, a } = { "cat", "dog" }
>** (MatchError) no match of right hand side value: {"cat", "dog"}
>Pretend to be Elixir executing this code. We're trying to make the LHS and RHS equal. The first thing we do is bind "cat" to a. Now that it is bound, a cannot be changed for the rest of this expression. So now Elixir is trying to reconcile the second a with "dog". It can't—there's no way {a, a} can match a tuple that has different elements.
>
>Shape and Values
>For a match to succeed, the LHS and RHS must have the same shape, and each value on the right must match the corresponding value on the left. If the thing on the left is an unbound variable, Elixir binds that variable to the value being matched.
>
>Elixir Won't Do Your Math Homework
>You might be hoping that you could write:
>
>x*x -2*x + 1 = 0
>and that Elixir would work out that x is 1.
>
>Sorry, but that ain't gonna happen. The LHS cannot contain any calculations or function calls.
>
>Pattern Matching and Expectations
>Think about the function File.open/1. It returns a tuple containing either { :ok, file } or { :error, reason }.
>
>We'll see later how you can write code to handle both cases. But you often don't want to deal with the error case—if the file cannot be opened, the code should just stop.
>
>You'll see people expressing this by writing:
>
>{ :ok, file } = File.open("/etc/passwd")
>If the open succeeds, the variable file will be bound to a handle for the file. If it fails, then the pattern match fails, and your code raises a MatchError. This is the Elixir way. "Fail early" is one of the keys to highly reliable code.
>
## Underscores in Pattern Matches
>The special variable whose name is a single underscore is never bound by pattern matching—in effect it acts as a placeholder, useful when you want to match the structure of a value, but don't care about some of the values it contains.
>
>[ a, _, _ ]       # match a three element list (where each element is
>                  # potentially different to the others) and
>                  # associate the value of the first element with `a`
>
>[ a, _, a ]       # match a three element list where the first and
>                  # last elements are the same, binding that value to `a`
>
>[ h | _ ]         # extract just the head of a list

## Matching Using Variable Values
>How could you use the value in a variable on the LHS of a pattern match? For example, could you do the following to match only tuples that start with 42?
>
>iex> first = 42
>42
>iex> { first, second } = { 42, 53 }
>{ 42, 53 }
>iex> first
>42
>Looks like it worked. But…
>
>iex> first = 42
>42
>iex> { first, second } = { 0, 1 }
>{ 0, 1 }
>iex> first
>0
>The match ignores the current value associated with first and rebinds it to the first element of the tuple. That's because all variables on the LHS of a match are unbound before the match is made.
>
>The solution is to use the pin operator, an uparrow, ^. Prefix a variable with an uparrow, and Elixir will not rebind its value:
>
>iex> first = 42
>42
>iex> { ^first, second } = { 42, 53 }
>{ 42, 53 }
>iex> { ^first, second } = { 0, 1 }
>** (MatchError) no match of right hand side value: { 0, 1 }
>✖

## Functions Pattern Match Their Parameters
>So far we've seen pattern matching in the context of the = operator. But pattern matching permeates Elixir. Later we'll look at pattern matching's role in message passing and conditional statements. In this section we'll look at the magic of functions.
>
>When you call a function, the arguments you pass are not simply assigned to the corresponding parameters in the function. Instead, each argument is pattern matched to its parameter.
>
>For example, here's a function that takes a two-element tuple:
>
>def func({ a, b }) do
>  IO.puts "a = #{a}, b = #{b}"
>end
>If we call it with func({1, 2}), the pattern match will bind 1 to a and 2 to b.
>
>If we want to access both the components of the tuple and the tuple itself, we could write:
>
>def func(t = { a, b }) do
>  IO.puts "a = #{a}, b = #{b}, is_tuple{t}"
>end
>This isn't special syntax. When the argument is matched to the parameter, it's as if we'd written
>
>t = { a, b } = { 1, 2 }
>Two pattern matches take place, and three variables are bound.
>
>Constants In The Patterns
>What does this function match?
>
>def read_file({ :ok, file }) do 
>  ...
>end
>It will only get invoked if it is passed a two element tuple where the first element is :ok.
>
>Similarly, the following function will only be invoked when passed an :error tuple.
>
>def read_file({ :error, reason }) do 
>  ...
>end
>Multiple Function Heads
>Many languages support method overloading—you can have two or more implementations of the same function if the specification of their parameters is different.
>
>It's the same in Elixir—functions can be overloaded based on the patterns their parameters match.
>
>Let's take the two functions we just wrote:
>
>def read_file({ :ok, file }) do 
>  file
>  |> IO.read(:line)
>end
>
>def read_file({ :error, reason }) do 
>  Logger.error("File error: #{reason}")
>  []
>end
>Remember that File.open returns a tuple containing either {:ok, file} or {:error, reason}. So let's use that fact in the following code:
>
>"my_file.txt"
>|> File.open
>|> read_file
>We passed the value returned by File.open to our read_file function. Elixir chose which of the two function bodies to invoke by pattern matching this value against the parameters. If the file was opened successfully, the first body will be called. If not, it'll call the second body.
>
>Unconditional Win!
>Look again at what we did here. First, we wrote a linear pipeline that transformed a filename into a collection of lines. The pipeline is not cluttered with conditional logic or error handling. It just states the transformation that is to happen.
>
>Then look at read_file. There are two implementations, depending on whether the File.open succeeded or not. But, again, we have no conditional logic.
>
>Pattern matching in parameter lists means we can take functions that would otherwise be a mess of nested conditional logic and rewrite them as a set of small, focused functions, each of which handles just one particular flow.
>
>This is a major win. It makes code easier to write, and easier to read. And code that is easier to read is easier to change. And that's what good design is.
>
>There's No Escaping the Man from Pisa
>One last pattern matching example. The mathematical definition of Fibonacci numbers (groan) is
>
>
>Here it is in Elixir, using pattern matching:
>
>defmodule Sequence do
>
>  def fib(0), do: 0
>  def fib(1), do: 1
>  def fib(n), do: fib(n-1) + fib(n-2)
>
>end
>I know; this is not an efficient implementation. That's not the point. Instead, think about how pattern matching lets us write code that is identical to the formal definition, and without any conditionals.
>
>We're going to be using pattern matched function calls a lot in our code. As a taste of things to come, the next section looks at how lists and functions go together like projects and overruns.
>

## Pattern Matching, Lists, and Recursion
>Why have a section on lists in a unit that's supposed to be about pattern matching?
>
>It's because the definition of an Elixir list is really just a pattern, and knowing that lets you manipulate lists with ease.
>
>It's so important that we'll go over it twice, once in a video, and once in the text.
>
>
>

>https://muse.ai/v/YAQhDqX
>What We Saw
>Just to refresh, a list is either:
>
>the empty list, or
>a head and a tail, where the tail is a list.
>The empty list looks like this: [ ]
>
>The list with a head h and a tail t looks like this: [ h | t ]
>
>The list containing the values 1 and 2 has a head of 1 and a tail which is another list. That second list has a head of 2 and tail which is the empty list. It looks like this:
>
>[ 1 | [ 2 | [] ] ]
>A list containing 1, 2, and 3 looks like this:
>
>[ 1 | [ 2 | [ 3 | [] ] ] ]
>This is valid Elixir syntax, but it's a pain in the butt to work with. We've already seen the shortcut syntax: [ 1, 2, 3 ]. Internally, Elixir converts this into the form using nested heads and tails.
>
>You can also combine notations: [ 1, 2, 3 | [ 4, 5 ] ] is the same as [ 1, 2, 3, 4, 5 ].
>
>So why all the gory detail? Because the way lists are built is also the way they are taken apart.
>
>Arbitrary Lists and Pattern Matching
>We saw how the vertical bar operator builds lists. We can also it to take lists apart in patterns.
>
>iex> my_list
>[ 1, 2, 3, 4 ]
>iex> [ head | tail ] = [ 1, 2, 3, 4 ]
>[ 1, 2, 3, 4 ]
>iex> head
>1
>iex> tail
>[ 2, 3, 4 ]
>The pattern [ head | tail ] matches the head (first value) and the tail (the rest) of the list. The head must receive a value, so this pattern cannot match the empty list. The tail will always be a list, but it might be empty.
>
>You can have multiple head elements in the match:
>
>[ a, b | tail ]       # matches a list of two or more elements,
>                      # putting the first into a, the second in b,
>                      # and the rest as a list in tail
>
>[ a, a | tail ]       # matches a list where the first two elements
>                      # are the same
>
>[ a | [ a | tail ] ]  # same as the previous example
## Let's Write Some Code
>Because lists are defined recursively, the functions that work on them also tend to be recursive. For example:
>
>the length of an empty list is zero
>the length of any other list is 1 plus the length of the tail
>Your Turn
>
>Open up an editor, and code along as we implement what follows.
>
>First we'll create a module to hold our code. All the functions that follow are defined inside this module.
>
>defmodule Lists do
>
>end
>Our first specification of list length says "the length of an empty list is zero." Here's the code:
>
>def len( [] ), do: 0
>Fire up iex on this module (I called mine lists.exs)
>
>$ iex lists.exs
>
>iex> Lists.len( [] )
>0
>iex> Lists.len( [ 1, 2, 3 ] )
>** (FunctionClauseError) no function clause matching in Lists.len/1
>    lists.exs:3: Lists.len([1, 2, 3])
>That's not unexpected—we haven't handled nonempty lists yet. Remember the spec: "the length of any other list is 1 plus the length of the tail."
>
>def len([]), do: 0
>def len([ _head | tail ]), do: 1 + len(tail)
>Back in iex, recompile the module and try again:
>
>iex> Lists.len( [] )
>0
>iex> Lists.len( [ 1, 2, 3 ] )
>3
>The key thing here is the pattern that matches the nonempty list. It splits the remaining list into a head and a tail. The body of the function then adds 1 (for the head) to the length of the tail. (I used _head in the pattern because I don't actually use the head. Without the underscore, I'd get a compilation warning about an unused variable.)
>
