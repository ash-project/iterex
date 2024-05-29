# 👁️🦖

Iterex is a library that provides external iterators for Elixir collections.

Iterators provide the flexibility of `Enum` with the laziness of `Stream` and the ability to pause and resume iteration.

The `Iter` module provides the public interface to working with iterators, which wraps an `Iter.Iterable` (to make it easier to pattern match, etc). You'll find most of the functions you'd want from `Stream` and `Enum` provided by this module, but often with different return values to enable you to resume iteration where possible. The `Enumerable` and `Collectable` protocols have been implemented for `Iter` so you can use them as drop in replacements for other collection types where needed.

Some differences from `Enum` and `Stream`:

- `Iter.next/1` - the core advantage of iterators over streams. Allows you to retrieve the next element from an iterator and a new iterator.
- `Iter.prepend/2`, `Iter.append/2` and `Iter.peek/1..2` - iterators can be easily composed allowing features that might otherwise break `Stream` semantics.

See the [documentation on hexdocs](https://hexdocs.pm/iterex) for more information.
