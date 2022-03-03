# elixir-tutorials

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
> atoms are indivisible pieces of data
> is it like binding data?

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