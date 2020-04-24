@AbapCatalog.sqlViewName: 'ZII310752_VSCI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart Item'
define view ZI_I310752_SC_item as select from zi310752_d_sc_i 

association [1..1] to ZI_I310752_SC_ROOT as _Root on _Root.db_key = $projection.parent_key
//association [0..1] to I_Material                     as _Material                      on  $projection.material = _Material.Material
{
  //ZI310752_D_SC_I
  key db_key,
  @ObjectModel.foreignKey.association: '_Root'
  parent_key,
  cart_id,
  item_id,
  
  @Consumption.semanticObject: 'Material'
  @ObjectModel.text.element: ['txz01']
  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_MaterialStdVH',
                 element: 'Material' }
    }]
//  @ObjectModel.foreignKey.association: '_Material'
  matnr,
  
  @Semantics.text: true
//  @EndUserText.label: 'Material Description'
  cast( txz01 as maktx preserving type ) as txz01,
  @Semantics.quantity.unitOfMeasure: 'uom'
  quantity,
  @Semantics.unitOfMeasure: true
  uom,
  @Semantics.amount.currencyCode: 'waers'
  netpr,
  @Semantics.currencyCode: true
  waers,
  peinh,
  lifnr  ,
  @ObjectModel.association.type: [#TO_AGGREGATION_PARENT,#TO_COMPOSITION_ROOT]
  _Root
}
