Template.createTransaction.created = () ->
  @subscribe('payees')


AutoForm.hooks 
  createTransaction: 
    onSubmit: (insertDoc, updateDoc, currentDoc) ->
      Meteor.call("createTransaction", insertDoc, ( error, result )->
        if result
          sAlert.success('Transaction was successfull!!', {effect: 'bouncyflip'});
          console.log result
          @done()
        )
      false
      