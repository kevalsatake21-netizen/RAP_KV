CLASS zcl_read_ptactice_ks DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_ptactice_ks IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    READ ENTITIES OF zi_travel_m_ks
    ENTITY zi_travel_m_ks
    ALL FIELDS
    WITH VALUE #( ( %key-TravelId = '00004272' ) )
    RESULT DATA(lt_result_travel)

*    ENTITY zi_booking_m_ks
*    ALL FIELDS
*    WITH VALUE #( (  %key-TravelId = '0000004272'
*                  %key-BookingId = '0020' ) )
*    RESULT DATA(lt_result_book)

    FAILED DATA(lt_failed_sort).

     IF lt_failed_sort IS NOT INITIAL.
      out->write( 'Read failed' ).

    ELSE.
      out->write( lt_result_travel ).
*      out->write( lt_result_book ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
