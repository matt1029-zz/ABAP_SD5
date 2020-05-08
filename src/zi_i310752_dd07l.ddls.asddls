@AbapCatalog.sqlViewName: 'ZI310752DD07L'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Basic view'

@ObjectModel.representativeKey: ['DomainValue']
@ObjectModel.usageType.dataClass: #META
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.usageType.sizeCategory: #S
@Search.searchable: true
define view ZI_I310752_DD07L as select from dd07l   
association [0..*] to ZI_I310752_DD07T as _DD07T on $projection.DomainValue = _DD07T.DomainValue
{                           
//    key dd07l.domname as DomainName,
    @Search: {
        defaultSearchElement: true,
        ranking: #HIGH,
        fuzzinessThreshold: 0.8
    }
    @EndUserText.label: 'Document Type'
    @ObjectModel.text.association: '_DD07T'
    key dd07l.domvalue_l as DomainValue,
    _DD07T
}
where domname = 'ZS4IBSO_DOCUMENT_TYPE'
and dd07l.as4local = 'A' 
and valpos <> '0000'
and as4vers = '0000'
