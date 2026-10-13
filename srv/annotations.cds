using ServiceEntrySheetService from './ses-service';


/*
 * ============================================================
 * SERVICE ENTRY SHEET - HEADER
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with @(

    UI.HeaderInfo : {
        TypeName       : 'Service Entry Sheet',
        TypeNamePlural : 'Service Entry Sheets',

        Title : {
            $Type : 'UI.DataField',
            Label : 'SES Number',
            Value : sesNumber
        },

        Description : {
            $Type : 'UI.DataField',
            Label : 'Purchase Order',
            Value : poNumber
        }
    },


    /*
     * ========================================================
     * LIST PAGE
     * ========================================================
     */

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Value : sesNumber,
            Label : 'SES Number'
        },

        {
            $Type : 'UI.DataField',
            Value : poNumber,
            Label : 'Purchase Order'
        },

        {
            $Type : 'UI.DataField',
            Value : vendor,
            Label : 'Vendor'
        },

        {
            $Type : 'UI.DataField',
            Value : serviceReceiver,
            Label : 'Service Receiver'
        },

        {
            $Type : 'UI.DataField',
            Value : department,
            Label : 'Department'
        },

        {
            $Type : 'UI.DataField',
            Value : servicePeriodFrom,
            Label : 'Service From'
        },

        {
            $Type : 'UI.DataField',
            Value : servicePeriodTo,
            Label : 'Service To'
        },

        {
            $Type : 'UI.DataField',
            Value : currency,
            Label : 'Currency'
        },

        {
            $Type : 'UI.DataField',
            Value : grossAmount,
            Label : 'Gross Amount'
        },

        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status'
        }
    ],


    /*
     * ========================================================
     * OBJECT PAGE FACETS
     * ========================================================
     */

    UI.Facets : [

        /*
         * SES Information
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SESInformationFacet',
            Label : 'SES Information',
            Target : '@UI.FieldGroup#SESInformation'
        },

        /*
         * Service Information
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ServiceInformationFacet',
            Label : 'Service Information',
            Target : '@UI.FieldGroup#ServiceInformation'
        },

        /*
         * Amount Information
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'AmountInformationFacet',
            Label : 'Amount Information',
            Target : '@UI.FieldGroup#AmountInformation'
        },

        /*
         * Service Entry Items
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Service Entry Items',
            Target : 'items/@UI.LineItem'
        },

        /*
         * Approval Information
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ApprovalInformationFacet',
            Label : 'Approval Information',
            Target : '@UI.FieldGroup#ApprovalInformation'
        },

        /*
         * Status History
         */
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StatusHistoryFacet',
            Label : 'Status History',
            Target : 'statusHistory/@UI.LineItem'
        }
    ],


    /*
     * ========================================================
     * SES INFORMATION
     * ========================================================
     */

    UI.FieldGroup #SESInformation : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : sesNumber,
                Label : 'SES Number'
            },

            {
                $Type : 'UI.DataField',
                Value : poNumber,
                Label : 'Purchase Order'
            },

            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Status'
            },

            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'Description'
            }
        ]
    },


    /*
     * ========================================================
     * SERVICE INFORMATION
     * ========================================================
     */

    UI.FieldGroup #ServiceInformation : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : vendor,
                Label : 'Vendor'
            },

            {
                $Type : 'UI.DataField',
                Value : serviceReceiver,
                Label : 'Service Receiver'
            },

            {
                $Type : 'UI.DataField',
                Value : department,
                Label : 'Department'
            },

            {
                $Type : 'UI.DataField',
                Value : servicePeriodFrom,
                Label : 'Service Period From'
            },

            {
                $Type : 'UI.DataField',
                Value : servicePeriodTo,
                Label : 'Service Period To'
            },

            {
                $Type : 'UI.DataField',
                Value : currency,
                Label : 'Currency'
            }
        ]
    },


    /*
     * ========================================================
     * AMOUNT INFORMATION
     * ========================================================
     */

    UI.FieldGroup #AmountInformation : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : netAmount,
                Label : 'Net Amount'
            },

            {
                $Type : 'UI.DataField',
                Value : taxAmount,
                Label : 'Tax Amount'
            },

            {
                $Type : 'UI.DataField',
                Value : grossAmount,
                Label : 'Gross Amount'
            }
        ]
    },


    /*
     * ========================================================
     * APPROVAL INFORMATION
     * ========================================================
     */

    UI.FieldGroup #ApprovalInformation : {
        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : approver,
                Label : 'Approver'
            },

            {
                $Type : 'UI.DataField',
                Value : approvalComments,
                Label : 'Approval Comments'
            },

            {
                $Type : 'UI.DataField',
                Value : rejectionComments,
                Label : 'Rejection Comments'
            }
        ]
    }
);


/*
 * ============================================================
 * HEADER FIELD CONTROL
 * ============================================================
 *
 * PO-derived / calculated / system-controlled fields are
 * read-only.
 *
 * User-maintained fields:
 *
 *     serviceReceiver
 *     department
 *     servicePeriodFrom
 *     servicePeriodTo
 *     description
 *
 * remain editable.
 *
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with {

    sesNumber
        @UI.ReadOnly
        @Core.Computed;

    status
        @UI.ReadOnly;

    vendor
        @UI.ReadOnly;

    currency
        @UI.ReadOnly;

    netAmount
        @UI.ReadOnly;

    taxAmount
        @UI.ReadOnly;

    grossAmount
        @UI.ReadOnly;

    approver
        @UI.ReadOnly;

    submittedBy
        @UI.ReadOnly;

    submittedAt
        @UI.ReadOnly;

    approvedBy
        @UI.ReadOnly;

    approvedAt
        @UI.ReadOnly;

    rejectedBy
        @UI.ReadOnly;

    rejectedAt
        @UI.ReadOnly;

    cancelledBy
        @UI.ReadOnly;

    cancelledAt
        @UI.ReadOnly;
};


/*
 * ============================================================
 * HEADER FIELD CONTROL
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with {

    sesNumber
        @Common.FieldControl : #ReadOnly;


    status
        @Common.FieldControl : #ReadOnly;

    vendor
        @Common.FieldControl : #ReadOnly;

    currency
        @Common.FieldControl : #ReadOnly;

    netAmount
        @Common.FieldControl : #ReadOnly;

    taxAmount
        @Common.FieldControl : #ReadOnly;

    grossAmount
        @Common.FieldControl : #ReadOnly;

    approver
        @Common.FieldControl : #ReadOnly;

    submittedBy
        @Common.FieldControl : #ReadOnly;

    submittedAt
        @Common.FieldControl : #ReadOnly;

    approvedBy
        @Common.FieldControl : #ReadOnly;

    approvedAt
        @Common.FieldControl : #ReadOnly;

    rejectedBy
        @Common.FieldControl : #ReadOnly;

    rejectedAt
        @Common.FieldControl : #ReadOnly;

    cancelledBy
        @Common.FieldControl : #ReadOnly;

    cancelledAt
        @Common.FieldControl : #ReadOnly;
};


/*
 * ============================================================
 * PO NUMBER - F4 / VALUE HELP
 * ============================================================
 *
 * Selecting a PO provides:
 *
 *     PO Number
 *     Vendor
 *     Currency
 *
 * The following PO fields are displayed in the F4:
 *
 *     Status
 *     Valid From
 *     Valid To
 *     Total Amount
 *
 * PO validity is used for backend validation of the SES
 * service period. It is NOT copied directly into the
 * SES service period fields.
 *
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with {

    poNumber @Common.ValueList : {

        $Type : 'Common.ValueListType',

        Label : 'Purchase Order',

        CollectionPath : 'PurchaseOrders',

        Parameters : [

            {
                $Type : 'Common.ValueListParameterInOut',

                LocalDataProperty : poNumber,

                ValueListProperty : 'poNumber'
            },

            {
                $Type : 'Common.ValueListParameterOut',

                LocalDataProperty : vendor,

                ValueListProperty : 'vendor'
            },

            {
                $Type : 'Common.ValueListParameterOut',

                LocalDataProperty : currency,

                ValueListProperty : 'currency'
            },

            {
                $Type : 'Common.ValueListParameterDisplayOnly',

                ValueListProperty : 'status'
            },

            {
                $Type : 'Common.ValueListParameterDisplayOnly',

                ValueListProperty : 'validFrom'
            },

            {
                $Type : 'Common.ValueListParameterDisplayOnly',

                ValueListProperty : 'validTo'
            },

            {
                $Type : 'Common.ValueListParameterDisplayOnly',

                ValueListProperty : 'totalAmount'
            }
        ]
    };
};


/*
 * ============================================================
 * PURCHASE ORDER VALUE HELP - LIST DISPLAY
 * ============================================================
 */

annotate ServiceEntrySheetService.PurchaseOrders with @(

    UI.HeaderInfo : {

        TypeName : 'Purchase Order',

        TypeNamePlural : 'Purchase Orders',

        Title : {
            $Type : 'UI.DataField',
            Label : 'PO Number',
            Value : poNumber
        },

        Description : {
            $Type : 'UI.DataField',
            Label : 'Vendor',
            Value : vendor
        }
    },

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Value : poNumber,
            Label : 'PO Number'
        },

        {
            $Type : 'UI.DataField',
            Value : vendor,
            Label : 'Vendor'
        },

        {
            $Type : 'UI.DataField',
            Value : currency,
            Label : 'Currency'
        },

        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'Status'
        },

        {
            $Type : 'UI.DataField',
            Value : validFrom,
            Label : 'Valid From'
        },

        {
            $Type : 'UI.DataField',
            Value : validTo,
            Label : 'Valid To'
        },

        {
            $Type : 'UI.DataField',
            Value : totalAmount,
            Label : 'Total Amount'
        }
    ]
);


/*
 * ============================================================
 * SIDE EFFECTS AFTER PO SELECTION
 * ============================================================
 *
 * After selecting a PO, refresh the PO-derived header fields.
 *
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with
    @Common.SideEffects #POChanged : {

        SourceProperties : [
            poNumber
        ],

        TargetProperties : [
            vendor,
            currency
        ]
    };


/*
 * ============================================================
 * SERVICE ENTRY SHEET ITEMS
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheetItems with @(

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Value : poItemNumber,
            Label : 'PO Item Number'
        },

        {
            $Type : 'UI.DataField',
            Value : serviceCode,
            Label : 'Service Code'
        },

        {
            $Type : 'UI.DataField',
            Value : serviceDescription,
            Label : 'Service Description'
        },

        {
            $Type : 'UI.DataField',
            Value : orderedQuantity,
            Label : 'Ordered Quantity'
        },

        {
            $Type : 'UI.DataField',
            Value : previouslyAcceptedQty,
            Label : 'Previously Accepted'
        },

        {
            $Type : 'UI.DataField',
            Value : pendingQuantity,
            Label : 'Pending Quantity'
        },

        {
            $Type : 'UI.DataField',
            Value : remainingQuantity,
            Label : 'Remaining Quantity'
        },

        {
            $Type : 'UI.DataField',
            Value : serviceEntryQuantity,
            Label : 'Service Entry Quantity'
        },

        {
            $Type : 'UI.DataField',
            Value : unit,
            Label : 'Unit'
        },

        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'Unit Price'
        },

        {
            $Type : 'UI.DataField',
            Value : netAmount,
            Label : 'Net Amount'
        },

        {
            $Type : 'UI.DataField',
            Value : taxAmount,
            Label : 'Tax Amount'
        },

        {
            $Type : 'UI.DataField',
            Value : grossAmount,
            Label : 'Gross Amount'
        }
    ],


    /*
     * ========================================================
     * ITEM HEADER
     * ========================================================
     */

    UI.HeaderInfo : {

        TypeName : 'Service Entry Sheet Item',

        TypeNamePlural : 'Service Entry Sheet Items',

        Title : {
            $Type : 'UI.DataField',
            Label : 'PO Item',
            Value : poItemNumber
        },

        Description : {
            $Type : 'UI.DataField',
            Label : 'Service',
            Value : serviceDescription
        }
    },


    /*
     * ========================================================
     * ITEM OBJECT PAGE FACETS
     * ========================================================
     */

    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemInformationFacet',
            Label : 'Item Information',
            Target : '@UI.FieldGroup#ItemInformation'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'QuantityInformationFacet',
            Label : 'Quantity Information',
            Target : '@UI.FieldGroup#QuantityInformation'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemAmountFacet',
            Label : 'Amount Information',
            Target : '@UI.FieldGroup#ItemAmountInformation'
        }
    ],


    /*
     * ========================================================
     * ITEM INFORMATION
     * ========================================================
     */

    UI.FieldGroup #ItemInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : poItemNumber,
                Label : 'PO Item Number'
            },

            {
                $Type : 'UI.DataField',
                Value : serviceCode,
                Label : 'Service Code'
            },

            {
                $Type : 'UI.DataField',
                Value : serviceDescription,
                Label : 'Service Description'
            },

            {
                $Type : 'UI.DataField',
                Value : unit,
                Label : 'Unit'
            }
        ]
    },


    /*
     * ========================================================
     * QUANTITY INFORMATION
     * ========================================================
     */

    UI.FieldGroup #QuantityInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : orderedQuantity,
                Label : 'Ordered Quantity'
            },

            {
                $Type : 'UI.DataField',
                Value : previouslyAcceptedQty,
                Label : 'Previously Accepted'
            },

            {
                $Type : 'UI.DataField',
                Value : pendingQuantity,
                Label : 'Pending Quantity'
            },

            {
                $Type : 'UI.DataField',
                Value : remainingQuantity,
                Label : 'Remaining Quantity'
            },

            {
                $Type : 'UI.DataField',
                Value : serviceEntryQuantity,
                Label : 'Service Entry Quantity'
            }
        ]
    },


    /*
     * ========================================================
     * ITEM AMOUNT INFORMATION
     * ========================================================
     */

    UI.FieldGroup #ItemAmountInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {
                $Type : 'UI.DataField',
                Value : unitPrice,
                Label : 'Unit Price'
            },

            {
                $Type : 'UI.DataField',
                Value : netAmount,
                Label : 'Net Amount'
            },

            {
                $Type : 'UI.DataField',
                Value : taxAmount,
                Label : 'Tax Amount'
            },

            {
                $Type : 'UI.DataField',
                Value : grossAmount,
                Label : 'Gross Amount'
            }
        ]
    }
);


/*
 * ============================================================
 * ITEM FIELD CONTROL
 * ============================================================
 *
 * Only Service Entry Quantity is entered by the user.
 *
 * PO-derived fields and calculated fields are read-only.
 *
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheetItems with {

    poItemNumber
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    serviceCode
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    serviceDescription
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    orderedQuantity
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    previouslyAcceptedQty
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    pendingQuantity
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    remainingQuantity
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    unit
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    unitPrice
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    netAmount
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    taxAmount
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;

    grossAmount
        @UI.ReadOnly
        @Common.FieldControl : #ReadOnly;
};


/*
 * ============================================================
 * STATUS HISTORY
 * ============================================================
 */

annotate ServiceEntrySheetService.StatusHistory with @(

    UI.LineItem : [

        {
            $Type : 'UI.DataField',
            Value : oldStatus,
            Label : 'Old Status'
        },

        {
            $Type : 'UI.DataField',
            Value : newStatus,
            Label : 'New Status'
        },

        {
            $Type : 'UI.DataField',
            Value : user,
            Label : 'User'
        },

        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'Timestamp'
        },

        {
            $Type : 'UI.DataField',
            Value : comments,
            Label : 'Comments'
        }
    ]
);


/*
 * ============================================================
 * ACTIONS
 * ============================================================
 */

annotate ServiceEntrySheetService.ServiceEntrySheets with @(

    UI.Identification : [

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ServiceEntrySheetService.submit',
            Label : 'Submit'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ServiceEntrySheetService.approve',
            Label : 'Approve'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ServiceEntrySheetService.reject',
            Label : 'Reject'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ServiceEntrySheetService.cancel',
            Label : 'Cancel'
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ServiceEntrySheetService.resubmit',
            Label : 'Resubmit'
        }
    ]
);