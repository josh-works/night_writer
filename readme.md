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

From the instructions:

> In order to break this problem down further, you may wish to work on things in the following order:
> 
> 1. Create a Ruby program that prints the sample line of text provided above no matter what arguments are provided from the command line.
> 1. Update your existing program so that the name of the file that it prints out changes based on the second input that the user provides from the command line.
> 1. Further update your program so that the number of characters it prints out changes based on the number of characters in the file that the user provides as the first argument that the user provides from the command line.


Let's do this in order. \#2 builds on \#1, and \# builds on \#2, etc etc.

## Create a Ruby program that prints the sample line of text provided above no matter what arguments are provided from the command line

So, how would we do this? How would we use it?

```
ruby something_or_another.rb
=> contents_of_message.txt
```

Cool. So, I've got two quotes in my `message.txt`, so lets figure out how to print it to the terminal.

Oh, and lets do it in my `night_writer` class, because I've already got it! I might not keep it there forever, but it's a starting point.

Take a look at this outline, see if you can figure it out:

https://github.com/josh-works/night_writer/commit/6b21c41

Consider skimming:

- [https://www.rubyguides.com/2015/05/working-with-files-ruby/](https://www.rubyguides.com/2015/05/working-with-files-ruby/)
- [https://www.educba.com/ruby-read-file/](https://www.educba.com/ruby-read-file/)

OK, so let's implement this first step: 

> Create a Ruby program that prints the sample line of text provided above no matter what arguments are provided from the command line.

Or, translated: 

> Modify your night_writer.rb file to print the contents of the file you created, so you can call `ruby lib/night_writer.rb` and get the file printed back to your terminal

Take a moment. Read the `rubyguides` link. 

[...]

Did you get it?

```ruby
# lib/night_writer.rb
class NightWriter
  def print_message
    file = File.open("message.txt").read
    puts file
  end
end
NightWriter.new.print_message
```

Boom. I'm seeing some sweet Robert Moses in my terminal:

![robert moses](/images/2021-03-06-at-4.47-PM-robert-moses.jpg)

Try changing the contents of _your_ `messages.rb`, see what kind of stuff you can print out for yourself. Maybe copy-paste random samples from [https://somuchtoread.wordpress.com/the-power-broker/](https://somuchtoread.wordpress.com/the-power-broker/)

Actually, I'll cycle through quotes from the above book summary in/out of my `messages.txt` file. You'll love it, I'm sure. :)

Here's the current commit:

https://github.com/josh-works/night_writer/commit/522c737

## Update your existing program so that the name of the file that it prints out changes based on the second input that the user provides from the command line.

phew, there's a middle step. Instead of `puts`'ing to the terminal, write a new file to the terminal. something like this:

```ruby
def read_write
  message = "i'm a cool message"
  File.open("./message.txt", "+a") do |file|
    file.write(message)
  end
end
```

Whenever you run the above bit of code, it _should_ create a new file with the given title, write the message to the file, and... if you `ls` wherever it wrote the file, you should see the new file. Try changing the message. 

So, we can upgrade this to make the message that we write to "dynamic", like:

```ruby
def read_write(desired_file_path)
  message = "i am a message"
  File.open(desired_file_path, "a+") do |file|
    file.write(message)
  end
end

NightWriter.new.read_write('write_to_this_file.txt')
```

I interpret this to mean:

> Update night_writer.rb so that: 
> 1. the name of the file that it writes to prints out changes based on the second input that you give it, like so:

```shell
ruby ./lib/night_writer write_a_message_to_this_file.txt
```

For getting this input from the command line, check out:

- [https://stackoverflow.com/questions/6556280/read-input-from-console-in-ruby](https://stackoverflow.com/questions/6556280/read-input-from-console-in-ruby)
- [https://www.codecademy.com/articles/ruby-command-line-argv](https://www.codecademy.com/articles/ruby-command-line-argv)
- [https://careerkarma.com/blog/build-ruby-cli/](https://careerkarma.com/blog/build-ruby-cli/)


-------------------- 

Hint for the CLI stuff:

```
$ ruby lib/night_writer.rb "hi there"
```

![it works](/images/2021-03-06-at-5.05-PM-argv.jpg)

Hint:

