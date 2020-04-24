@AbapCatalog.sqlViewName: 'ZCDEMO_SO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales order'
@OData.publish: true
define view ZC_DEMO_SALES_ORDER as select from vbak {
 //vbak
 key vbeln as SalesOrder1,
 erdat,
 erzet,
 ernam
 
}
