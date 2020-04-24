*&---------------------------------------------------------------------*
*& Report zi310752_sc_data
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zi310752_sc_data.

DELETE FROM zi310752_d_sc_r.
    INSERT zi310752_d_sc_r FROM TABLE @( VALUE #(
    ( db_key = cl_system_uuid=>create_uuid_x16_static( )  cart_id = '0000000001'    document_type = '0001' crea_uname = sy-uname  crea_date_time = cl_rsbpc_services=>get_utc_timestamp( ) )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( )  cart_id = '0000000002'    document_type = '0001' crea_uname = sy-uname  crea_date_time = cl_rsbpc_services=>get_utc_timestamp( ) )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( )  cart_id = '0000000003'    document_type = '0001' crea_uname = sy-uname  crea_date_time = cl_rsbpc_services=>get_utc_timestamp( ) )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( )  cart_id = '0000000004'    document_type = '0001' crea_uname = sy-uname  crea_date_time = cl_rsbpc_services=>get_utc_timestamp( ) )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( )  cart_id = '0000000005'    document_type = '0003' crea_uname = sy-uname  crea_date_time = cl_rsbpc_services=>get_utc_timestamp( ) )
    ) ).

    SELECT db_key FROM zi310752_d_sc_r INTO TABLE @DATA(lt_keys).

    DELETE FROM zi310752_d_sc_i.
    INSERT zi310752_d_sc_i FROM TABLE @( VALUE #(
    ( db_key = cl_system_uuid=>create_uuid_x16_static( ) parent_key = lt_keys[ 1 ]-db_key matnr = 'HT-1003' txz01 = 'Notebooks'               netpr  = 500 waers = 'EUR' )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( ) parent_key = lt_keys[ 2 ]-db_key matnr = 'HT-1007' txz01 = 'PDAs & Organizers'       netpr  = 400 waers = 'EUR' )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( ) parent_key = lt_keys[ 3 ]-db_key matnr = 'HT-1052' txz01 = 'Ink Jet Printers'        netpr  = 200 waers = 'USD' )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( ) parent_key = lt_keys[ 4 ]-db_key matnr = 'HT-1055' txz01 = 'Multifunction Printers'  netpr  = 650 waers = 'USD' )
    ( db_key = cl_system_uuid=>create_uuid_x16_static( ) parent_key = lt_keys[ 5 ]-db_key matnr = 'HT-1095' txz01 = 'Headsets'                netpr  = 220 waers = 'EUR' )
     ) ).

    DATA(lt_selopt) = VALUE  /iwbep/t_cod_select_options( (
    sign = 'I' option = 'BT' low = 100 high = 1000
    ) ).

    SELECT
           db_key,
           matnr AS material,
           txz01 AS text,
           concat_with_space( matnr,txz01, 1 )  AS concat_with_space,
           replace(           txz01,'&','__' ) AS replace_and,
           rpad(              txz01,10,'x' )    AS rpad,
           substring(         txz01,3,5 )       AS substring_35,
           upper(             txz01 )           AS upper
           FROM zi310752_d_sc_i
           WHERE netpr IN @lt_selopt
           INTO TABLE @DATA(result).

    cl_demo_output=>display( result ).
