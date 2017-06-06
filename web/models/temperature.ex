# web/models/temperature.ex
defmodule Picellar.Temperature do
  use Picellar.Web, :model

  schema "temperatures" do
    field :temp, :float

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
      |> cast(params, [:temp])
      |> validate_required([:temp])
  end
end


