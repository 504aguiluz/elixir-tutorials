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
