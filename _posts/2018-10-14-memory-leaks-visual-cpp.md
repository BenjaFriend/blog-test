---
id: 822
title: Debugging Memory Leaks with Visual C++
date: 2018-10-14T02:16:02+00:00
author: Ben Hoffman
layout: post
categories:
  - C++
  - General
---

Recently I have been working a lot with debugging different programs in C and
C++ for some of my classes, and I really liked how [Valgrind](http://valgrind.org/)
prints out the location of where the memory was being allocated.

Since I am typically using Visual Studio for my C++ programming, I was curious
if there was a something similar you could do in the IDE. I knew about
`_CrtDumpMemoryLeaks`, but I wanted more.

Turns out that Visual C++ makes it pretty easy to get the same Valgrind-style
debugging printed right to the console.

Here I will give a simple example of how you can replace the `new` keyword
with a debug `#define` to add the file and line number to the `_CrtDumpMemoryLeaks`
output.

## Project Setup

Create a new C++ project in Visual Studio,
( `File -> New -> Project -> Visual C++ -> Windows Console Application` ).

By default, Visual Studio will create a `stdafx.h`, which is a pre-compiled
header file that will be added to each class you make. That's a good place to
put these debug definitions, but if you choose not to use that in your project
then I recommend making some kind of `DebugHelper.h` file or something, as you
will probably want this functionality in more than one class / file.

#### Header File

```C
//////////////////////////////////
// Debug definitions
#define _CRTDBG_MAP_ALLOC  
#include <stdlib.h>  
#include <crtdbg.h>  

// Replace the new keyword with the debug new
#ifdef _DEBUG

#define DEBUG_NEW new(_NORMAL_BLOCK, __FILE__, __LINE__)
#define new DEBUG_NEW

#endif
```

Lets go through this line by line.

`#define _CRTDBG_MAP_ALLOC`  directly maps the base version of heap functions
to their debug versions. It's used in `crtdbg.h`, so make sure that this is added
before the include of that header!

The `crtdbg.h` header file maps the `malloc` and `free` functions to their debug
versions, which is how it tracks memory allocations.

Next up we have the debug definition for replacing the `new` keyword with its
debug version. The `__FILE__` and `__LINE__` will add the file name and line
to where the memory leak is happening respectively.

#### Cpp File

Now that we have the proper debug definitions added to our header file, we can
call the necessary functions to actually print debug info.

At the top of the main function, add the following:

```
#ifdef _DEBUG
    _CrtSetDbgFlag( _CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF );

    _CrtSetReportMode( _CRT_ERROR, _CRTDBG_MODE_DEBUG );
#endif
```


`_CrtSetDbgFlag( _CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF )` will cause
`_CrtDumpMemoryLeaks` to be called at each exit point of the program, so you
don't need to place the call there every time yourself.

`_CrtSetReportMode( _CRT_ERROR, _CRTDBG_MODE_DEBUG )` will just redirect the
output of the debugging to the right place, because some libraries may redirect
it elsewhere.

That's it! Now you run your program and you have a memory leak, then you would
see output like this:


![Memory Leak Output]({{ site.url }}\media\posts\mem_leaks\MemLeakOutput.png)


I realize that this is kind of basic, but hopefully it will help some people out.
This really saved a lot of time for my team debugging DirectX 12 leaks, and can
be really useful for large scale projects and debugging other people's code! 
