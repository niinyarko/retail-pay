Meteor.methods
  createTransaction: (doc) ->
    res = Transactions.insert doc

    Meteor.defer ->