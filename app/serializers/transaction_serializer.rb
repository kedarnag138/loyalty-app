class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :transaction_date, :latitude, :longitude, :amount, :user_id
end