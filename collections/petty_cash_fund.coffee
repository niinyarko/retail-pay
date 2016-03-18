@PettyCashFund = new Meteor.Collection('petty_cash_fund');

Schemas.PettyCashFund = new SimpleSchema
  amount:
    type: Number
    label: "Amount (GHS)"

  createdAt:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type:Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      omit: true
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

PettyCashFund.attachSchema(Schemas.PettyCashFund)
