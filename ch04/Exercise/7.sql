use AP;

Select GLAccounts.AccountNo, AccountDescription
From GLAccounts LEFT JOIN InvoiceLineItems
	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
Order by AccountNo;
