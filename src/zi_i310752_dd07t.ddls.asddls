@AbapCatalog.sqlViewName: 'ZI310752DD07T'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Basic view text'

@ClientHandling.algorithm: #SESSION_VARIABLE
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey:  ['DomainValue']
@VDM.viewType: #BASIC

define view ZI_I310752_DD07T as select from dd07t 
association [0..1] to ZI_I310752_DD07L as _DD07L on $projection.DomainValue = _DD07L.DomainValue
association[0..1] to I_Language as _Language on $projection.Language = _Language.Language
{
//    @ObjectModel.foreignKey.association: '_DD07L'
//    key domname as DomainName,
    @ObjectModel.foreignKey.association: '_DD07L'
    key domvalue_l as DomainValue,
    @Semantics.language: true
    @ObjectModel.foreignKey.association: '_Language'
    key ddlanguage as Language,  
        @Search: {
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
    }
    @EndUserText.label: 'Document Type Desc.'
    @Semantics.text: true
    ddtext as DoaminText,
    
    //Associations
    _DD07L,
    _Language
}
where domname = 'ZS4IBSO_DOCUMENT_TYPE'
and dd07t.as4local = 'A' 
and valpos <> '0000'
and as4vers = '0000'
and dd07t.ddlanguage = $session.system_language;   
 