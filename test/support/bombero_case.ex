defmodule BomberoCase do
  use ExUnit.CaseTemplate

  @mongo_database Application.get_env(:bombero, Bombero.Database)[:database]

  setup do
    on_exit fn ->
      Bombero.TestMessenger.reset

      # TODO Replace hard-coded ID with something more robust
      if Bombero.Game.find(123456) do
        Bombero.Game.stop(123456)
      end

      # Clear database between test runs
      System.cmd("mongo", ~w'#{@mongo_database} db.getCollectionNames().forEach(function(n){db[n].remove()});')
    end
  end
end
