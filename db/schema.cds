namespace ses;

using { cuid, managed } from '@sap/cds/common';

entity ServiceEntrySheets : cuid, managed {

    sesNumber           : String(20);
    
    poNumber            : String(20);
    vendor              : String(100);
    serviceReceiver     : String(100);
    department          : String(100);

    servicePeriodFrom   : Date;
    servicePeriodTo     : Date;

    currency            : String(3);

    netAmount           : Decimal(15,2);
    taxAmount           : Decimal(15,2);
    grossAmount         : Decimal(15,2);

    status              : String(20) default 'Draft';

    description         : String(500);

    approver            : String(100);
    approvalComments    : String(500);
    rejectionComments   : String(500);

    submittedBy         : String(100);
    submittedAt         : Timestamp;

    approvedBy          : String(100);
    approvedAt          : Timestamp;

    rejectedBy          : String(100);
    rejectedAt          : Timestamp;

    cancelledBy         : String(100);
    cancelledAt         : Timestamp;

    items               : Composition of many ServiceEntrySheetItems
                              on items.ses = $self;

    statusHistory       : Composition of many StatusHistory
                              on statusHistory.ses = $self;
}


entity ServiceEntrySheetItems : cuid, managed {

    ses                     : Association to ServiceEntrySheets;

    poItemNumber            : String(10);

    serviceCode             : String(50);
    serviceDescription      : String(500);

    orderedQuantity         : Decimal(15,3);
    previouslyAcceptedQty   : Decimal(15,3);
    pendingQuantity         : Decimal(15,3);
    remainingQuantity       : Decimal(15,3);

    serviceEntryQuantity    : Decimal(15,3);

    unit                    : String(10);

    unitPrice               : Decimal(15,2);

    netAmount               : Decimal(15,2);
    taxAmount               : Decimal(15,2);
    grossAmount             : Decimal(15,2);
}


entity StatusHistory : cuid, managed {

    ses         : Association to ServiceEntrySheets;

    oldStatus   : String(20);
    newStatus   : String(20);

    user        : String(100);
    timestamp   : Timestamp;

    comments    : String(500);
}