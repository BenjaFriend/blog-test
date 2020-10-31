## Getting Started writting Posts

# Docker

I've setup a docker file which will run the jekyll web server on `localhost:4000`. You can
run it with the following commands: 

```console
docker build . -t ben-web
docker run ben-web
```

This is the preferred way to run this site because it is the easiest and works on all platforms that support Docker.

If you need to install Docker, then please refer to their [docs](https://docs.docker.com/engine/install/ubuntu/).

# Native Ruby/Jekyll Install

If you don't or can't use the nice little Dockerfile then you will
have to get setup for dev on your host machine with Ruby. 

# Install Ruby

## Ubuntu
```console
sudo apt-get install ruby ruby-dev build-essential
```

## Arch (Manjaro)
```console
sudo pacman -S ruby
```

## Windows

Please refer to the [offical docs](https://jekyllrb.com/docs/installation/windows/) for Windows 
installation instructions.

With Ruby installed, you can set your gemgem install location
anywhere you like by adding it to your environment. 

zshrc:
```console
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.zshrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.zshrc
PATH=$PATH:~/.gem/ruby/2.7.0/bin
```

bashrc:
```console
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
PATH=$PATH:~/.gem/ruby/2.7.0/bin
```

Note that the last part of that updates that path whereever the
actual gems are installed, which will vary on your system and
what version of Ruby you install. You will need to close/re-open 
your terminal tab to refresh the paths.

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

If you run into issues try these commands:

```console
bundle update jekyll
gem update jekyll
```

# Running a local server
Simply execture this command to run a local web server on port 4000:

`bundle exec jekyll serve --watch`

There is also the `run.sh` script, which simply runs the above command in `#/bin/bash`
