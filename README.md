# Project Euler :: Ten problems challenge
Solutions to problem 1-10 in rust, haskell, python, reasonml, elixir.

I have only had previous experience in Python, which was done for comparison. While it would be interesting to compare the solution sizes for different languages, this is not recommended as certain functions inflate the code (primarily the prime sieve).

The goal has not been to make fast solutions, but solutions that demonstrates the language's features and capabilities.



## Why Project Euler ?
Project Euler is a terrible measure for comparing programming languages, because it only tests for specific use cases. The problems still give a good introduction to a language.



## Notes
Most of the problems are solved with native libraries, with a few exceptions.

* Python's arrays are usually ignored in favour of numpy's arrays, even though a native array library exist.  
* Rust does not have native string interpolation, so [ifmt](https://docs.rs/ifmt/0.2.0/ifmt/) was used.  
* ReasonML's integers were Int32 by default, and the operators (+, -, \*, /, ...) were not valid for Int64.
