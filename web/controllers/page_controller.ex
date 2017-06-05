defmodule Picellar.PageController do
  use Picellar.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
