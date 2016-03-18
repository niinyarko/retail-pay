@Transactions = new Meteor.Collection('transactions');

Schemas.Transactions = new SimpleSchema

  payee:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoform:
      firstOption: ->
        if Meteor.isClient
          "Select payee"
      options: ->
        Payees.find().map (c) ->
          name = c.first_name + " " + c.last_name
          {
              label: name
              value: c._id
          }

  amount:
    type: Number

  createdAt:
    type: Date
    autoform:
      omit: true
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type:Date
    optional:true
    autoform:
      omit: true
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

Transactions.attachSchema(Schemas.Transactions)