Template.adminCollectionWidget.rendered = () ->
  elem = $( "a[href='/admin/PettyCashFund']" ).addClass('petty-cash')
  petty_cash = PettyCashFund.findOne({owner: Meteor.userId()})
  if petty_cash
    petty_cash_fund = petty_cash?.amount
    _.each Transactions.find(owner: Meteor.userId()).fetch(), (transaction) ->
      petty_cash_fund -= transaction?.amount
    $(".petty-cash h3").text(petty_cash_fund)

Template.AdminSidebar.rendered = () ->
  petty_cash = PettyCashFund.findOne({owner: Meteor.userId()})
  if petty_cash
    _id = petty_cash?._id
    elem = $( "a[href='/admin/PettyCashFund/new']" ).attr('href', "/admin/PettyCashFund/#{_id}/edit")