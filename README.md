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
>-Created an assets directory in our project and download words.txt into it.
>
>-Went into iex, and typed File.↦ (where ↦ represents the tab character). Tab completion displayed the list of File functions, and we use h File.read to get help.
>
>-We chose File.read! to read the wordlist and String.split to break it into a list of words.
>
>-We combined the two into a function, Dictionary.word_list, and played with it in iex.
>
>-We also saw examples of tuples and regular expression literals. We'll look at these in more detail in the next chapter.
>
>
>
>
>
>
>
>
>