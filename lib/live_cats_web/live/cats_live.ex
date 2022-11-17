defmodule LiveCatsWeb.CatsLive do
  use LiveCatsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:cats, get_cats(socket))
    }
  end

  defp get_cats(socket) do
    if connected?(socket) do
      url = "https://api.thecatapi.com/v1/images/search?limit=10"
      {:ok, res} = HTTPoison.get(url)
      {:ok, cats} = Jason.decode(res.body)
      cats
    else
      []
    end
  end
end
