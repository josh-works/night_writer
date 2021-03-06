## Night Writer

I'm working through Turing's [Night Writer](https://backend.turing.io/module1/projects/night_writer/index). Similar approach as to what I did with [futbol](https://github.com/josh-works/futbol) and [War and Peace](https://github.com/josh-works/war_and_peace/).

It _might_ be helpful to have worked through a bit of the above `Futbol` project, to get a feel for my goals/methodologies/goals/constraints.

Onward!

https://github.com/josh-works/night_writer/commit/19b01a1

----------------

## Reading Night Writer Spec

Reading through [https://backend.turing.io/module1/projects/night_writer/index](https://backend.turing.io/module1/projects/night_writer/index)

So, it looks like we'll be expected to build a command-line program that takes arguments, and does stuff to it.

For example, I can type (in my terminal) `pwd` and get back... my present working directory.

Or, you could type:

```
echo "hi there"
=> hi there
```

(try the above in your terminal!)

Now, you could "redirect" that message to a new file, if you wanted. Type this in your terminal:


```
echo "hi there" >> message.txt
```

Now, go open up `message.txt`. I've got it visible here, in my terminal. Screenshot for evidence:

![screenshot](/images/2021-03-06-at-4.14-PM-echo.jpg)

Again, try it yourself, in your terminal. This relates to the program you're about to build.

So, we've got this `echo` command, that  takes an input, and writes it to a text file.

Now try this:

```
cat message.txt

cat message.txt >> duplicate_message.txt

cat duplicate_message.txt
```

You 'read' a file, and wrote it to a new file.

That's related to what we're going to do when we run the given command, from the project spec:

```shell
ruby ./lib/night_writer.rb message.txt braille.txt
```

This can be understood as:

```shell
ruby ./lib/night_writer.rb message.txt braille.txt
# run a script             input_msg    output_msg
```

So, you'll build a little ruby application that will do a few things:

1. Read a text file
2. Write to a text file

For starters, you could try to make a ruby app that just... copies, and maybe modifies, a certain file into a new file. 

After writing the new file, print a message to the terminal saying that you did as much.

Let's start there, re-reading the steps:

> In the example above:
> 
>     ./lib/night_writer.rb is the path to your Ruby program.
>     message.txt is the name of an existing text file in your project directory.
>     braille.txt is the name that we would like to give to a file that we will create in iteration 2.
>     256 is the count of characters in your message.txt file.

So lets do that. Create a `lib/night_writer.rb` file (and it's associated test file. Get them both outlined as much as we can right now, without knowing anything else about what we're going to write. Check the commit I'll give you in a moment for an example).

Besides creating the `night_writer` file, we'll create a `message.txt` file, containing... however many characters we want.

Here's what I did:
 
[https://github.com/josh-works/night_writer/commit/63d438c](https://github.com/josh-works/night_writer/commit/63d438c)