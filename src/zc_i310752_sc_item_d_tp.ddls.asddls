@AbapCatalog.sqlViewName: 'ZCI310752VDSCITP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Shopping Cart Item Draft TP Consumption'

@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.semanticKey: ['cart_id', 'item_id']

@VDM.viewType: #CONSUMPTION
@Search.searchable: true

@UI.headerInfo:{
  typeName: 'Shopping Cart Item',
  typeNamePlural: 'Shopping Cart Items',
  title: { label: 'Items', value: '_Item' }
}
define view ZC_I310752_SC_ITEM_D_TP as select from ZI_I310752_SC_ITEM_D_TP 
association [1..1] to ZC_I310752_SC_ROOT_D_TP as _Root on _Root.db_key = $projection.parent_key
{

    //ZI_I310752_SC_ITEM_D_TP
//@UI.facet: [
//{
//    id: 'GeneralInfo',
//    purpose: #STANDARD,
//    position: 10,
//        label: 'General Info Items',
//    type: #COLLECTION 
//}]
    @UI.hidden: true
    key db_key,
    @UI.hidden: true
    parent_key,
    @ObjectModel.readOnly: true
    @UI.lineItem.position: 20
//    @UI.identification.position: 20
    cart_id,
    @UI.lineItem.position: 30
    item_id,
    
    @UI.lineItem.position: 40
    @Search: {
    ranking: #HIGH ,
    defaultSearchElement: true,
    fuzzinessThreshold: 0.8
    }
    @ObjectModel.text.element: ['txz01']
    matnr,
    @Search: {
    ranking: #MEDIUM ,
    defaultSearchElement: true,
    fuzzinessThreshold: 0.8
    }
    txz01,
    @UI.lineItem.position: 50
    @Semantics.quantity.unitOfMeasure: 'uom'
    quantity,
    @Semantics.unitOfMeasure: true
    @Consumption.valueHelpDefinition: [{ entity: { name : 'I_UnitOfMeasure', element : 'uom' } }]
    uom,
    @UI.lineItem.position: 60
    @Semantics.amount.currencyCode: 'waers'
    netpr,
    @Semantics.currencyCode: true
    @Consumption.valueHelpDefinition: [{ entity: { name : 'I_CurrencyStdVH', element : 'waers' } }]
    waers,
    @UI.lineItem.position: 70
    @Semantics.amount.currencyCode: 'waers'
    peinh,
    @UI.lineItem.position: 80
    lifnr,
    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _Root
}
