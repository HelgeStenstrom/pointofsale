# Point of Sale, using Test Driven Development

But first: Working with fractions.

Based on JBrains' course "The world's best introduction to TDD", which happens to use Java.
Let's see if the techniques works with Haskell too.

Inspiration when I'm stuck (but don't deviate from the TDD path!):
<http://5outh.blogspot.com/2012/08/haskell-implementing-fractional-data.html>

## General workflow considerations

* Use HUnit first, since it resembles JUnit more than QuickCheck do. In other words, make assertions on the values returned from functions.
* Start with a simple production code file and a test file, according to the best known file layout and stack setup.
* It would be interesting to use TCR, but I'll save that for a later date.
* Let's see if the tests can guide me to the needed data types, or if the types come first.

## Fractions

### Test plan

* Represent fraction by whole number DONE
* String representation of whole number DONE
* Add integers
  * 0 + 0
  * Something + 0
  * 0 + Something
  * something + something else

### TO do list

* Split the tests into separate files
* String representation for whole number fraction (Show)

## Web links that helped me

* Generating arbitrary but non-zero denominators:
<https://stackoverflow.com/questions/39291494/only-generate-positive-integers-with-quickcheck>.
