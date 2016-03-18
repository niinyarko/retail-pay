Template.pettyCashWidget.helpers
  pettycashBalance: () ->
    petty_cash_fund = PettyCashFund.findOne(owner: Meteor.userId())?.amount
    _.each Transactions.find().fetch(), (transaction) ->
      petty_cash_fund -= transaction?.amount
    console.log petty_cash_fund
    petty_cash_fund
