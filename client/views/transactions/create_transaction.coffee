Template.createTransaction.created = () ->
  @subscribe('payees')


AutoForm.hooks
  contactForm:
    onSubmit: (insertDoc, updateDoc, currentDoc) ->
      