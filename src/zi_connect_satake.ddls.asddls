@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_CONNECT_SATAKE
  as select from /dmo/connection as CONNECTION
{ 
      @UI.lineItem: [{ position: 10 }]
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20 }]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40 }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      @UI.lineItem: [{ position: 80 }]
      distance_unit   as DistanceUnit
}
