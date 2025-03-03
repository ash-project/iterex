defmodule Iter.Error.IterExhausted do
  @moduledoc """
  An error which occurs when the end of an iterator is reached before an
  expected condition occurs.
  """
  use Splode.Error, fields: [:message], class: :unknown

  @type t :: %__MODULE__{
          message: String.t(),
          splode: any,
          bread_crumbs: [any],
          vars: [any],
          path: [any],
          stacktrace: nil | Splode.Stacktrace.t(),
          class: :unknown
        }

  def message(error) do
    """
    # IterExhausted

    #{@moduledoc}

    ## Message

    #{error.message}
    """
  end
end
