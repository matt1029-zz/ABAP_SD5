@AbapCatalog.sqlViewName: 'ZCV_SO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales order'
@OData.publish: true
define view ZC_SALESORDER as select from vbak 
association [1..*] to vbap as _Item on _Item.vbeln = vbak.vbeln
{
    //vbak
    key vbeln,
    erdat,
    erzet,
    ernam,
    angdt,
vkorg,
    vtweg,
    spart,
    _Item
   
}
