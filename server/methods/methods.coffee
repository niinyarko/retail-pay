Meteor.methods
  createTransaction: (doc) ->
    @unblock()
    Meteor.defer ->
      try
        result = HTTP.call('POST', 'http://testpay.vodafonecash.com.gh', params: username: '711500', password: 'hackathon2', token: 'abc1234', amount: doc.amount)
        html_res = result?.content
        return html_res
      catch e
        # Got a network error, time-out or HTTP error in the 400 or 500 range.
        return false
      return


            