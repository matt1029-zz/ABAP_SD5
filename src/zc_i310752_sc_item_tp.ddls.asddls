@AbapCatalog.sqlViewName: 'ZCI310752_VSCITP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shopping Cart Item TP'

@VDM.viewType: #CONSUMPTION

@ObjectModel.createEnabled
@ObjectModel.updateEnabled
@ObjectModel.deleteEnabled

@UI.headerInfo:{
  typeName: 'Shopping Cart Item',
  typeNamePlural: 'Shopping Cart Items',
  title: { label: 'Items', value: 'scart_items' }
}
@Search.searchable: true

define view ZC_I310752_SC_ITEM_TP as select from ZI_I310752_SC_ITEM_TP 
association [1..1] to ZC_I310752_SC_ROOT_TP as _Root on _Root.db_key = $projection.parent_key
{
    //ZI_I310752_SC_ITEM_TP
      @UI.facet: [
               { label: 'General Information',
                 id: 'GeneralInformation',
                 type: #COLLECTION,
                 purpose: #STANDARD,
                 position: 10
               },
               { label: 'Basic Data',
                 id: 'BasicData',
                 type: #IDENTIFICATION_REFERENCE,
                 parentId: 'GeneralInformation',
                 position: 10
               }]
      @UI.hidden: true    
    key db_key,
    @UI.hidden: true
    parent_key,
@UI.hidden: true
    cart_id,
      @UI.lineItem.position: 20
      @UI.identification.position: 20    
    item_id,
      @UI.lineItem.position: 30
      @UI.identification.position: 30
      @Search.defaultSearchElement: true   
      @ObjectModel.text.element: 'txz01'
       matnr,
      @UI.lineItem.position: 40
      @UI.identification.position: 40
      txz01,
      @UI.lineItem.position: 50
      @UI.identification.position: 50
      quantity,
      @UI.lineItem.position: 60
    uom,
      @UI.lineItem.position: 70
      @UI.identification.position: 70
      netpr,
      @UI.lineItem.position: 80
    waers,
    peinh,
      @UI.lineItem.position: 100
      @UI.identification.position: 100    
    lifnr,
    /* Associations */
    @ObjectModel.association.type:[#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _Root
}
