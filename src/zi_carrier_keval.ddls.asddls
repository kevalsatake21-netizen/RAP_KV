@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Master Data Text Provider'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

define view entity ZI_CARRIER_KEVAL
  as select from /dmo/carrier
{
  key carrier_id    as CarrierId,
      @Semantics.text: true // Crucial: Tells RAP this field contains the text for the key above
      name          as Name,
      currency_code as CurrencyCode
}
