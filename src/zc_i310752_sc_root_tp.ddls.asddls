@AbapCatalog.sqlViewName: 'ZCI310752_VSCRTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart TP Consumption'

@VDM.viewType: #CONSUMPTION

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.compositionRoot: true

@ObjectModel.createEnabled
@ObjectModel.updateEnabled
@ObjectModel.deleteEnabled

@OData.publish: false

@UI.headerInfo:{
  typeName: 'Shopping Cart',
  typeNamePlural: 'Shopping Carts',
  title: { label: 'ShCart', value: 'scart' }
}
define view ZC_I310752_SC_ROOT_TP
  as select from ZI_I310752_SC_ROOT_TP
  association [0..*] to ZC_I310752_SC_ITEM_TP as _Item on _Item.parent_key = $projection.db_key
{

      @UI.facet: [
      { label: 'General Information',
        id: 'GeneralInformation',
        type: #COLLECTION,
        position: 10
      },
      {
        label: 'Basic Data',
        id: 'BasicData',
        parentId: 'GeneralInformation',
        type: #IDENTIFICATION_REFERENCE,
        position: 10
      },
      {
        label: 'Items',
        id: 'Items',
        type: #LINEITEM_REFERENCE,
        position: 20,
        targetElement: '_Item'
      } ]

      @UI.hidden
  key db_key,
      @UI.identification.position: 10
      @UI.selectionField.position: 10
      @UI.lineItem.position: 10
//       @UI.lineItem:
//       [
//         { type: #FOR_ACTION, position: 1, dataAction: 'BOPF:CALCULATE_TOTAL_VALUE', label: 'Calculate Total Value' }
//       ]      
      cart_id,
      @UI.identification.position: 20
      @UI.selectionField.position: 20
      @UI.lineItem.position: 20
      @ObjectModel.foreignKey.association: '_DocTypeVH'
      document_type,
      @UI.identification.position: 30
      @UI.lineItem.position: 30
      curr_max_itm_no,
      @ObjectModel.readOnly: true
      @UI.identification.position: 40
      @UI.lineItem.position: 40
      itm_count,
      @ObjectModel.readOnly: true
      @UI.identification.position: 50
      @UI.lineItem.position: 50
      @Semantics.systemDateTime.createdAt: true
      crea_date_time,
      @ObjectModel.readOnly: true
      @UI.identification.position: 60
      @UI.lineItem.position: 60
      @Semantics.user.createdBy: true
      crea_uname,
      @ObjectModel.readOnly: true
      @UI.identification.position: 70
      @UI.lineItem.position: 70
      @Semantics.systemDateTime.lastChangedAt: true
      lchg_date_time,
      @ObjectModel.readOnly: true
      @UI.identification.position: 80
      @UI.lineItem.position: 80
      @Semantics.user.lastChangedBy: true
      lchg_uname,
      @ObjectModel.readOnly: true
      @UI.lineItem.position: 90
      @Semantics.amount.currencyCode: 'waers'
      total_val_net,
      @UI.identification.position: 90
      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{ entity: { name : 'I_CurrencyStdVH', element : 'waers' } }]
      waers,
      /* Associations */
      @ObjectModel.association.type : #TO_COMPOSITION_CHILD
      _Item,
      _DocTypeVH,
      _CurrencyVH
}
