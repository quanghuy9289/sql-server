select * from Recipe;

select * from OutletHierarchy where parentOutletId = 2
select * from OutletContact
select * from OutletType

select invoiceId, invoiceNo, invoiceDate, Invoice.outletIds, Invoice.supplierId, supplierName, abnNo, Supplier.outletIds AS AllocationOutlet
from Invoice, Supplier
where Invoice.supplierId = Supplier.supplierId and Supplier.isActive = 1 and Invoice.isActive = 1
--Group by outletIds
order by Invoice.outletIds, invoiceDate DESC;

select * from OutletSupplier where isActive=1

select * from Supplier where isActive=1

select * from OutletAllocationInvoice


Select i.invoiceId, invoiceDate, oh.outletId, oh.outletName, s.supplierId, s.supplierName, s.abnNo
from Invoice as i inner join OutletAllocationInvoice as oi on i.invoiceId = oi.invoiceId 
	inner join OutletHierarchy oh on oh.outletId = oi.outletId 
	inner join Supplier as s on s.supplierId = i.supplierId
where oh.outletId = 2 and i.IsActive=1 and s.IsActive=1
order by supplierId, invoiceDate DESC;

SELECT  *
FROM    (Select i.invoiceId, invoiceDate, oh.outletId, oh.outletName, s.supplierId, s.supplierName, s.abnNo,
                ROW_NUMBER() OVER (PARTITION BY s.supplierId ORDER BY invoiceDate DESC) AS RowNumber
         from Invoice as i inner join OutletAllocationInvoice as oi on i.invoiceId = oi.invoiceId 
			inner join OutletHierarchy oh on oh.outletId = oi.outletId 
			inner join Supplier as s on s.supplierId = i.supplierId
		where oh.outletId in (select outletId from OutletHierarchy) and i.IsActive=1 and s.IsActive=1)
		AS a
WHERE   a.RowNumber = 1
order by outletId

update OutletHierarchy
set orderNo = 2
where outletId=63