Template.createTransaction.created = () ->
  @subscribe('payees')


AutoForm.hooks 
  createTransaction: 
    onSuccess: (formType, result) ->
      sAlert.success('Transaction was successfull!!', {effect: 'bouncyflip'})
      