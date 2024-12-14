#!/bin/sh
nix run nixpkgs#nodejs -- -e 'console.log((new require("./wat.js").VM()).run(["+", 1, 2]));'
