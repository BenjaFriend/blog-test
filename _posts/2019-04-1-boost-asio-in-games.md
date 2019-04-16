---
id: 823
title: Boost ASIO in Games
date: 2019-04-01T02:16:02+00:00
author: Ben Hoffman
layout: post
categories:
  - cpp
  - General
---

The first time that I knew that I wanted to pursue game development as a career
was when played Halo 3 online for the first time. Ever since then, I have
been interested in networked games. This semester I am a part of a
research group where I am building a networked game engine. This has really
given me the opportunity to truly explore something that I am passionate about
while learning a ton from a bunch of really talented peers and professors.  

There were a couple of specific goals that I had in mind for my engine:
* Server Authoritative architecture
* Cross Platform network stack (Windows and Linux)
* LLVM/Clang compatibility

## Game Design

The final deliverable that  I want to see with this project is a small tank
shooter game. Think _Wii Tanks!_ kind of gameplay:

![Wii Tanks screen shot]({{ site.url }}\media\posts\boost-asio\wii_tanks.jpg)

Why did I choose this type of game and minimal design for the engine? There were
a couple of reasons, mainly because of scale restrictions, and so that I can
focus on creating a networking stack opposed to gameplay programming.

## Boost ASIO

With the design of the game set, and an engine that  I started the semester
before using DirectX 11, I  had to decide how to go about creating my network
stack. This is where [Boost ASIO](https://www.boost.org/doc/libs/1_69_0/doc/html/boost_asio.html)
comes into play.

There were  a couple of reasons that I decided to use Boost as a framework for
networking. First of all, because  I wanted the engine to be cross platform.
By using ASIO I would be able to use a consistent API on both of my target platforms
without having to write my own abstraction layer. I know that this layer between
POSIX and WinSoc really is not all that involved, but it is still work that I would
have to put in and code that I would have to maintain. Secondly, ASIO is held
to a pretty high standard, and I knew that I could trust the quality of the library
(and that it would probably be better than any abstraction I could write myself).

So far Boost sounds like an awesome networking layer that I should use, but what
problems could I run into using it in games?

One of the biggest questions that I wanted to answer with this project was how
using Boost would effect the threading model of an existing engine, or 
