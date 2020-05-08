@AbapCatalog.sqlViewName: 'ZCI310752VDSCRTP '
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Shopping Cart Draft TP Consumption'

@VDM.viewType: #CONSUMPTION

@ObjectModel.compositionRoot: true
@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.draftEnabled: true
@ObjectModel.createEnabled
@ObjectModel.updateEnabled
@ObjectModel.deleteEnabled 
@ObjectModel.semanticKey: ['cart_id']

@OData.publish: true

@UI.headerInfo: {
    typeName: 'Shopping Cart Draft',
    typeNamePlural: 'Shopping Cart Draft',
    title: {
        type: #STANDARD,
        label: 'ShCart',
        value: 'scart'
    }
}

@Metadata.allowExtensions: true

define view ZC_I310752_SC_ROOT_D_TP as select from ZI_I310752_SC_ROOT_D_TP 
 association [0..*] to ZC_I310752_SC_ITEM_D_TP as _Item on _Item.parent_key = $projection.db_key
{
    //ZI_I310752_SC_ROOT_D_TP
    
    
    key db_key,
      
      
          
      
    cart_id,
      
      
      
      
    
    document_type,
      
          
      
    curr_max_itm_no,
      @ObjectModel.readOnly: true
      
         
       
    itm_count,
      @ObjectModel.readOnly: true
      
      
      @Semantics.systemDate.createdAt: true    
      
    crea_date_time,
      @ObjectModel.readOnly: true
      
      
      @Semantics.user.createdBy: true  
        
    crea_uname,
      @ObjectModel.readOnly: true
      
      
      @Semantics.systemDateTime.lastChangedAt: true
          
    lchg_date_time,
       @ObjectModel.readOnly: true
       
           
      @Semantics.user.lastChangedBy: true    
         
    lchg_uname,
      @ObjectModel.readOnly: true
      
      @Semantics.amount.currencyCode: 'waers' 
          
    total_val_net,
      
      @Semantics.currencyCode: true
      
    waers ,
    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _Item,
    _DocTypeVH
}
