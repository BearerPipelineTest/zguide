defmodule Rrclient do
  @moduledoc """
  Generated by erl2ex (http://github.com/dazuma/erl2ex)
  From Erlang source: (Unknown source file)
  At: 2019-12-20 13:57:31

  """

  def main() do
    {:ok, context} = :erlzmq.context()
    {:ok, requester} = :erlzmq.socket(context, :req)
    #:ok = :erlzmq.connect(requester, 'tcp://*:5559')
    :ok = :erlzmq.connect(requester, 'tcp://localhost:5559')
    :lists.foreach(fn num ->
      :erlzmq.send(requester, "Hello")
      {:ok, reply} = :erlzmq.recv(requester)
      :io.format('Received reply ~b [~s]~n', [num, reply])
    end, :lists.seq(1, 10))
    :ok = :erlzmq.close(requester)
    :ok = :erlzmq.term(context)
  end

end

Rrclient.main()