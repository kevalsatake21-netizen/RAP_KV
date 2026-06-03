@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity zi_booking_satake
  as select from /dmo/booking
  
  // Link back up to the Root Parent
  association to parent zi_flight_keval  as _flight on  $projection.CarrierId    = _flight.CarrierId
                                                    and $projection.FlightDate   = _flight.FlightDate
                                                    and $projection.ConnectionId = _flight.ConnectionId

  // Plain Text Lookup Association
  association [1] to ZI_CARRIER_KEVAL as _carrier on $projection.CarrierId = _carrier.CarrierId
{
      @UI.lineItem: [{ position: 10 }]
  key travel_id     as TravelId,
  
      @UI.lineItem: [{ position: 20 }]
  key booking_id    as BookingId,
  
      @UI.lineItem: [{ position: 30 }]
      booking_date  as BookingDate,
      
      @UI.lineItem: [{ position: 40 }]
      customer_id   as CustomerId,
      
      @UI.lineItem: [{ position: 50 }]
      @ObjectModel.text.association: '_carrier' // MOVED HERE: Correctly maps Carrier ID to its Name
      carrier_id    as CarrierId,
      
      @UI.lineItem: [{ position: 60 }]
      connection_id as ConnectionId,
      
      @UI.lineItem: [{ position: 70 }]
      flight_date   as FlightDate,
      
      @UI.lineItem: [{ position: 80 }]
      @Semantics.amount.currencyCode : 'CurrencyCode'
      flight_price  as FlightPrice,
      
      @UI.lineItem: [{ position: 90 }]
      currency_code as CurrencyCode,
      
      // Expose associations
      _flight,
      _carrier
}
