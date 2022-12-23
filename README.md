# Twix

Twix is a small utility library for dealing with Tailwind classes in Elixir. It is inspired by [tailwind-merge](https://github.com/dcastil/tailwind-merge).

## Problem

Overriding Tailwind classes is unintuitive. For example, suppose that
there is a LiveView function component that renders a button:

```elixir
attr :class, :string, default: ""
attr :label, :string, required: true

def button(assigns) do
  ~H"""
  <button type="button" class=(["inline-flex items-center rounded-md bg-green-600 px-4 py-2 text-white shadow-sm hover:bg-green-700", @class]}>
    <%= @label %>
  </button>
  """
end
```

Now we have a very simple button component. But suppose we want to change some attributes, such as changing the color to red?
Intuitively we might think that we can do something like:

```
<.button label="Cancel" class="bg-red-600 hover:bg-red-700" />
```

We switch back over to our browser, but we are disappointed to see that the button is still green! Our intuition might be that
the `bg-red-600` will override the `bg-green-600` class, but that is not correct. What ends up happening is that *both* classes
are defied on the HTML element and the one that "wins" is the one that appears later in the CSS stylesheets.

## Solution

Twix provides a simple utility class to aid in solving this problem. It's the `Twix.tw/1` function. This simply takes
a string and determines the "winning" classes by what comes later in the string, not in the stylesheet. For example:

```elixir
import Twix

attr :class, :string, default: ""
attr :label, :string, required: true

def button(assigns) do
  ~H"""
  <button type="button" class={tw(["inline-flex items-center rounded-md bg-green-600 px-4 py-2 text-white shadow-sm hover:bg-green-700", @class])}>
    <%= @label %>
  </button>
  """
end
```

Now when we call `<.button label="Cancel" class="bg-red-600 hover:bg-red-700">` it will retain all the default classes, but it will
see that `bg-green-600` and `bg-red-600` both belong to the `bg-color` group and the last class of that group will be rendered in
the string while all previous ones will be dropped. It will also see the `hover` variants and, once again, the last `bg-color` group
with the `hover` variant will remain while all previous ones are dropped.

Now we have a red button, as we intended!

## Installation

This package can be installed by adding `twix` to your
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:twix, "~> 0.2.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/twix>.

