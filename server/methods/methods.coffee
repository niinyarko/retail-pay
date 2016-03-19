Meteor.methods
  createTransaction: (doc) ->
    res = Transactions.insert doc

    payee_phone = Payees.findOne(doc.payee)?.phone_number
    payer_phone = Meteor.users.findOne(_id: @userId)?.profile?.phone_number

    options1 = 
      {
        vendor: 711500
        amount: doc.amount
        phone: payer_phone
      }

    options2 = 
      {
        username: 711500
        password: "hackathon2"
        token: "abc1234"
        amount: doc.amount
      }

    @unblock()
    Meteor.defer ->
      try
        result = HTTP.call('POST', 'http://testpay.vodafonecash.com.gh/SendSMS.php', params: options1)
        console.log result
      catch e
        console.log e
      return

            