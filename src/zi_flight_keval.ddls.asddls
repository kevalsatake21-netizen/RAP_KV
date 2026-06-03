@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flights details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Flight',
    typeNamePlural: 'Flights'
}

define root view entity zi_flight_keval
  as select from /dmo/flight

  // Strict RAP Hierarchy: Flight owns Bookings
  composition [0..*] of zi_booking_satake as _booking

  // Value Lookup: Plain text association for Carrier Name
  association [1] to ZI_CARRIER_KEVAL  as _carrier on $projection.CarrierId = _carrier.CarrierId
{
      @UI.facet: [{
                    id: 'firstobject',
                    purpose: #STANDARD,
                    position: 10,
                    type: #IDENTIFICATION_REFERENCE ,
                    label: 'Flights details' },
                  {
                    id: 'secondobject',
                    purpose: #STANDARD,
                    position: 20,
                    type: #LINEITEM_REFERENCE ,
                    label: 'Booking detail',
                    targetElement: '_booking' }]

      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_carrier' // Maps 'AA' or 'LH' to the Name field
  key carrier_id     as CarrierId,

      @UI.lineItem: [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
  key connection_id  as ConnectionId,

      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
  key flight_date    as FlightDate,

      @UI.lineItem: [{ position: 40, label: 'Pricing' }]
      @Semantics.amount.currencyCode : 'CurrencyCode'
      @UI.identification: [{ position: 40 }]
      price          as Price,

      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,

      @UI.identification: [{ position: 50 }]
      seats_max      as SeatsMax,
      @UI.identification: [{ position: 60 }]
      seats_occupied as SeatsOccupied,

      // Expose associations
      _booking,
      _carrier
}
