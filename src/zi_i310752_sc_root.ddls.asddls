@AbapCatalog.sqlViewName: 'ZII310752_VSCR'
@ClientHandling.algorithm:#SESSION_VARIABLE
@VDM.viewType: #CONSUMPTION
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart'
//@OData.publish: true

define view ZI_I310752_SC_ROOT as select from zi310752_d_sc_r 

association [0..*] to ZI_I310752_SC_item as _Item on _Item.parent_key = $projection.db_key
association [0..1] to ZI_I310752_DD07L as _DocTypeVH on _DocTypeVH.DomainValue = $projection.document_type
association [0..1] to I_CurrencyStdVH as _CurrencyVH on _CurrencyVH.Currency = $projection.waers
{
//ZI310752_D_SC_r
key db_key,
cart_id,
@ObjectModel.foreignKey.association: '_DocTypeVH'
document_type,
curr_max_itm_no,
itm_count,
//@Semantics.systemDate.createdAt: true
@Semantics.systemDateTime.createdAt: true
crea_date_time,
@Semantics.user.createdBy: true
crea_uname,
@Semantics.systemDateTime.lastChangedAt: true
lchg_date_time,
@Semantics.user.lastChangedBy: true
lchg_uname,
@Semantics.amount.currencyCode: 'waers'
total_val_net,
@Semantics.currencyCode: true
waers   ,

@ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
_Item,
_DocTypeVH,
_CurrencyVH
}
