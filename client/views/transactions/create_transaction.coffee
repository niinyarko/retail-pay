Template.createTransaction.created = () ->
  @subscribe('payees')


AutoForm.hooks 
  createTransaction: 
    onSubmit: (insertDoc, updateDoc, currentDoc) ->
      Meteor.call("createTransaction", insertDoc, ( error, result )->
        if result
          console.log result
          Transactions.insert insertDoc
          @done()
        )
      false
      