## Getting Started writting Posts

For Ubuntu, use the following commands to install jekyll and ruby

# Docker

```
docker build . -t ben-web
docker run ben-web
```

Will run a server on port 4000. You may run into some firewall settings you 
have to allow before you can access the page, but I will leave that
to you.

# The annoying way...

If you don't or can't use the nice little Dockerfile then you will
have to get setup for dev on your host machine with Ruby. 

# Install Ruby

## Ubuntu
```console
sudo apt-get install ruby ruby-dev build-essential
```

## Arch (Manjaro)

Install ruby via PacMan
```console
sudo pacman -S ruby
```

With Ruby installed, you can set your gemgem install location
anywhere you like by adding it to your enviornment. Here's a quick
echo to `zshrc` if you use that. 

```console
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.zshrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.zshrc
PATH=$PATH:~/.gem/ruby/2.7.0/bin
```

Note that the last part of that updates that path whereever the
actual gems are installed, which will vary on your system and
what version of Ruby you install.

# Install Gems

You can quickly confirm your Ruby install by checking the version:

```console
ruby -v
```

Then you can actually install the gems that are needed for this site:

```console
gem sources --add https://rubygems.org/
gem install jekyll bundler
```

If you run into issues try this command:

`bundle update jekyll`

`gem update jekyll`


# Running a local server
Simply execture this command to run a local web server on port 4000

`bundle exec jekyll serve --watch`

there is also the `run.sh` script, which simply runs the above command.
