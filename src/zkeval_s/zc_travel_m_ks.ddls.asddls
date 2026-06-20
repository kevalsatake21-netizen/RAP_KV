@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_M_KS
  provider contract transactional_query
  as projection on ZI_TRAVEL_M_KS
{
  key TravelId,
      @ObjectModel.text: {
          element: [ 'AgenctName' ]
      }
      AgencyId,
      _Agency.Name       as AgenctName,
      @ObjectModel.text: {
          element: [ 'CustomerName' ]
      }
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'currencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'currencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text: {
          element: [ 'OverallStatusText' ]
      }
      OverallStatus,
      _status._Text.Text as OverallStatusText : localized ,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_BOOKING_M_KS,
      _currency,
      _Customer,
      _status
}
