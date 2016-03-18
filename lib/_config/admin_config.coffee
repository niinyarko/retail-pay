@AdminConfig =
	name: Config.name
	collections:
		Payees:
			color: 'red'
			icon: 'users'
			tableColumns: [
				{ label: 'First Name', name: 'first_name' }
				{ label: 'Last Name', name: 'last_name' }
				{ label: 'Phone Number', name: 'phone_number' }
			]
		Transactions:
			color: 'green'
			icon: 'money'
			tableColumns: [
				{ label: 'Payee', name: 'payee' }
				{ label: 'AMount Paid', name: 'amount' }
				{ label: 'Transaction Date', name: 'createdAt'}
			]
			###children: [
				{
					find: (comment) ->
						Posts.find comment.doc, limit: 1
				}
				{
					find: (comment) ->
						Meteor.users.find comment.owner, limit: 1
				}
			]###
	dashboard:
		homeUrl: '/dashboard'
	autoForm:
		omitFields: ['createdAt', 'updatedAt']
