defmodule Febrd.Infura do
  use Web3,
    rpc_endpoint: "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
    http: HTTPoison,
    headers: [{"Authorization", "Bearer YOUR_INFURA_PROJECT_ID"}]

  middleware Febrd.Middleware.Logger

  # Function to send Ethereum transactions
  def send_transaction(from, to, value) do
    Web3.eth_sendTransaction(%{
      from: from,
      to: to,
      value: value
    })
  end

  # Function to retrieve Ethereum block information by block number
  def get_block_by_number(block_number) do
    Web3.eth_getBlockByNumber(block_number, true)
  end

  # Function to retrieve Ethereum block information by block hash
  def get_block_by_hash(block_hash) do
    Web3.eth_getBlockByHash(block_hash, true)
  end

  # Function to retrieve Ethereum transaction information by transaction hash
  def get_transaction(tx_hash) do
    Web3.eth_getTransactionByHash(tx_hash)
  end

  # Function to retrieve the number of transactions conducted by an address
  def get_transaction_count(address) do
    Web3.eth_getTransactionCount(address, "latest")
  end

  # Function to retrieve transaction history for an address
  def get_transaction_history(address) do
    Web3.eth_getTransactionHistory(%{
      address: address,
      sort: "desc",
      limit: 10
    })
  end
end
