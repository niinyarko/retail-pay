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
				{ label: 'Payee', name: 'payee_name' }
				{ label: 'Amount Paid', name: 'amount' }
				{ label: 'Transaction Date', name: 'createdAt'}
			]
			templates:
				new: 
					name: 'createTransaction'

		PettyCashFund:
			color: 'yellow'
			icon: 'money'
			tableColumns: [
				{ label: 'Amount (GHS)', name: 'amount' }
				{ label: 'Created At', name: 'createdAt'}
				{ label: 'Updated At', name: 'updatedAt' }
			]

	dashboard:
		homeUrl: '/dashboard',

	autoForm:
		omitFields: ['createdAt', 'updatedAt']
