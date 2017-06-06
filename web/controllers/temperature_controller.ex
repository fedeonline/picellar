# web/controllers/temperature_controller.ex
defmodule Picellar.TemperatureController do
  use Picellar.Web, :controller

  defp conn_with_status(conn, nil) do
    conn
      |> put_status(:not_found)
  end

  defp conn_with_status(conn, _) do
    conn
      |> put_status(:ok)
  end

  def index(conn, _params) do
    temperatures = Repo.all(Picellar.Temperature)
    json conn_with_status(conn, temperatures), temperatures
  end

  def show(conn, %{"id" => id}) do
    temperature = Repo.get(Picellar.Temperature, String.to_integer(id))
    json conn_with_status(conn,temperature), temperature
  end

  def create(conn, params) do
    changeset = Picellar.Temperature.changeset(%Picellar.Temperature{}, params)

    case Repo.insert(changeset) do
      {:ok, temperature} ->
        json conn |> put_status(:created), temperature
      {:error, _changeset} ->
        json conn |> put_status(:bad_request), %{errors: ["unable to create temperature"]}
    end
  end

  def delete(conn, %{"id" => id}) do
    temperature = Repo.get(Picellar.Temperature, String.to_integer(id))

    Repo.delete!(temperature) 
    json conn |> put_status(:no_content), nil
  end
end
