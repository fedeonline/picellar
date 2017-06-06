defmodule Picellar.Repo.Migrations.CreateTemperature do
  use Ecto.Migration

  def change do
    create table(:temperatures) do
      add :temp, :float

      timestamps()
    end
  end
end
