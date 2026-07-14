defmodule FunctionalPOC do

  ###########################################################
  # 1. Função pura
  ###########################################################

  def soma(a, b) do
    a + b
  end

  ###########################################################
  # 2. Imutabilidade
  ###########################################################

  ###########################################################
# 2. Imutabilidade
###########################################################

def depositar(conta, valor) do
  %{conta | saldo: conta.saldo + valor}
end

def sacar(conta, valor) do
  %{conta | saldo: conta.saldo - valor}
end

def immutable_example do
  conta = %{
    titular: "Davi",
    saldo: 1000
  }

  conta2 = depositar(conta, 500)

  conta3 = sacar(conta2, 200)

  IO.puts("Estado inicial:")
  IO.inspect(conta)

  IO.puts("\nApós depósito:")
  IO.inspect(conta2)

  IO.puts("\nApós saque:")
  IO.inspect(conta3)

  IO.puts("\nO estado inicial continua o mesmo:")
  IO.inspect(conta)
end

  ###########################################################
  # 3. Recursão (substitui loops)
  ###########################################################

  def soma_lista([]), do: 0

  def soma_lista([head | tail]) do
    head + soma_lista(tail)
  end

  ###########################################################
  # 4. map
  ###########################################################

  def quadrados(lista) do
    Enum.map(lista, fn x ->
      x * x
    end)
  end

  ###########################################################
  # 5. filter
  ###########################################################

  def pares(lista) do
    Enum.filter(lista, fn x ->
      rem(x, 2) == 0
    end)
  end

  ###########################################################
  # 6. reduce
  ###########################################################

  def soma_reduce(lista) do
    Enum.reduce(lista, 0, fn valor, acumulador ->
      acumulador + valor
    end)
  end

  ###########################################################
  # 7. Funções como argumentos
  ###########################################################

  def executar(lista, funcao) do
    Enum.map(lista, funcao)
  end

  ###########################################################
  # 8. Composição
  ###########################################################

  def pipeline(lista) do
    lista
    |> Enum.filter(fn x -> rem(x,2) == 0 end)
    |> Enum.map(fn x -> x*x end)
    |> Enum.sum()
  end

  ###########################################################
  # 9. Pattern Matching
  ###########################################################

  def descrever([]) do
    "Lista vazia"
  end

  def descrever([head | tail]) do
    "Primeiro=#{head}, restante=#{inspect(tail)}"
  end

end

#############################################################
# Demonstração
#############################################################

IO.puts("Função pura")
IO.inspect FunctionalPOC.soma(10,20)

IO.puts("-------------------")

IO.puts("Imutabilidade")
conta = %{
  titular: "Davi",
  saldo: 1000
}

conta = FunctionalPOC.depositar(conta, 500)

IO.inspect(conta)

FunctionalPOC.immutable_example

IO.puts("-------------------")

lista = [1,2,3,4,5]

IO.puts("Recursão")
IO.inspect FunctionalPOC.soma_lista(lista)

IO.puts("-------------------")

IO.puts("Map")
IO.inspect FunctionalPOC.quadrados(lista)

IO.puts("-------------------")

IO.puts("Filter")
IO.inspect FunctionalPOC.pares(lista)

IO.puts("-------------------")

IO.puts("Reduce")
IO.inspect FunctionalPOC.soma_reduce(lista)

IO.puts("-------------------")

IO.puts("Função como parâmetro")

dobro = fn x -> x * 2 end

IO.inspect FunctionalPOC.executar(lista, dobro)

IO.puts("-------------------")

IO.puts("Pipeline")

IO.inspect FunctionalPOC.pipeline(lista)

IO.puts("-------------------")

IO.puts("Pattern Matching")

IO.puts FunctionalPOC.descrever(lista)

IO.puts FunctionalPOC.descrever([])
