@AbapCatalog.sqlViewName: 'ZII310752VDSCITP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart Item Draft TP'

@ObjectModel.writeActivePersistence: 'ZI310752_D_SC_I'
@ObjectModel.writeDraftPersistence: 'ZI310752_D_SC_ID'
@ObjectModel.semanticKey: ['cart_id','item_id']

@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

define view ZI_I310752_SC_ITEM_D_TP as select from ZI_I310752_SC_item 
association [1..1] to ZI_I310752_SC_ROOT_D_TP as _Root on _Root.db_key = $projection.parent_key
{
    //ZI_I310752_SC_ITEM
    key db_key,
    parent_key,
    cart_id,
    item_id,
    matnr,
    txz01,
    quantity,
    uom,
    netpr,
    waers,
    peinh,
    lifnr,
    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
    _Root
}
