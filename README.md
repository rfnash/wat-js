# Wat

### Concurrency and Metaprogramming for JS

Wat is a tiny language for embedding in JavaScript programs with
powerful concurrency and metaprogramming features.

* Delimited continuations http://www.cs.indiana.edu/~dyb/pubs/monadicDC.pdf

* Delimited dynamic binding http://okmij.org/ftp/papers/DDBinding.pdf

* First-class lexical environments and fexprs ftp://ftp.cs.wpi.edu/pub/techreports/pdf/05-07.pdf

* Hygienic macros

* First-order control (sequential, conditional, loop, throw, catch, finally) running on JS stack

* Interop with JavaScript objects, functions, and callbacks

* JSON-based syntax for embedding Wat code in JavaScript

Wat is developed by Manuel Simoni (msimoni@gmail.com).

### Usage

#### Browser

    <html>
    <head>
      <script type="text/javascript" src="wat.js"></script>
    </head>
    <body>
      <script type="text/javascript">
        var vm = new wat.VM();
        console.log(vm.run(["+", 1, 2]));
      </script>
    </body>
    </html>

#### Node.js

    > var wat = require("./wat");
    > var vm = new wat.VM();
    > vm.run(["+", 1, 2]);
    3

### More documentation upcoming!

For now, follow http://axisofeval.blogspot.com/search/label/wat and/or
https://twitter.com/msimoni for updates.
