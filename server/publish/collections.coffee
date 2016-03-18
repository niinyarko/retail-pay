# You'll want to replace these functions. They publish the whole
# collection which is problematic after your app grows

Meteor.publish 'posts', ->
	Posts.find()

Meteor.publish 'attachments', ->
	Attachments.find()

Meteor.publish 'payees', ->
  Payees.find()

Meteor.publish 'transactions', ->
  Transactions.find()

Meteor.publish 'posts', ->
  Posts.find()