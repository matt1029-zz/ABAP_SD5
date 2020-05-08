@AbapCatalog.sqlViewName: 'ZII310752_VSCRTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart TP'

@ObjectModel.compositionRoot:true
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.writeActivePersistence: 'ZI310752_D_SC_R'

@ObjectModel.createEnabled
@ObjectModel.updateEnabled
@ObjectModel.deleteEnabled

define view ZI_I310752_SC_ROOT_TP as select from ZI_I310752_SC_ROOT 
association [0..*] to ZI_I310752_SC_ITEM_TP as _Item on _Item.parent_key = $projection.db_key
{
  //ZI_I310752_SC_ROOT
  key db_key,
  cart_id,
  document_type,
  curr_max_itm_no,
  itm_count,
  crea_date_time,
  crea_uname,
  lchg_date_time,
  lchg_uname,
  total_val_net,
  waers,
  /* Associations */
  @ObjectModel.association.type: #TO_COMPOSITION_CHILD
  _Item,
  _DocTypeVH,
  _CurrencyVH 
}
