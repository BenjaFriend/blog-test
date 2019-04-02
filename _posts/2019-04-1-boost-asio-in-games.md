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

The final deliverable that  I want to see with this project is a small tank
shooter game. Think _Wii Tanks!_ kind of gameplay:

![Wii Tanks screen shot]({{ site.url }}\media\posts\boost-asio\wii_tanks.jpg)

Why did I choose this type of game and minimal design for the engine? There were
a couple of big reasons:
* Minimal objects to replicate
    * Tanks and bullets essentially
* Small number of players ( 2 - 8 )
