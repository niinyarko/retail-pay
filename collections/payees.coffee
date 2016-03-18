@Payees = new Meteor.Collection('payees');

Schemas.Payees = new SimpleSchema
  first_name:
    type:String

  last_name:
    type: String

  phone_number:
    type: String

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

Payees.attachSchema(Schemas.Payees)