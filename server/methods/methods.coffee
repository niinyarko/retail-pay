Meteor.methods
  createTransaction: (doc) ->
    res = Transactions.insert doc
    res
    # @unblock()
    # Meteor.defer ->
    #   try
    #     result = HTTP.call('POST', 'http://testpay.vodafonecash.com.gh', params: username: '711500', password: 'hackathon2', token: 'abc1234', amount: doc.amount)
    #     html_res = result?.content
    #     return html_res
    #   catch e
    #     return false
    #   return


            