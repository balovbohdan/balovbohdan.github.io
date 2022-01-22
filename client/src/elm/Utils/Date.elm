module Utils.Date exposing (parseTimestamp)

import Time

stampToMonth : Int -> String
stampToMonth stamp =
  let
    posix = Time.millisToPosix stamp
    month = Time.toMonth Time.utc posix
  in
    case (month) of
      Time.Jan -> "Jan"
      Time.Feb -> "Feb"
      Time.Mar -> "Mar"
      Time.Apr -> "Apr"
      Time.May -> "May"
      Time.Jun -> "Jun"
      Time.Jul -> "Jul"
      Time.Aug -> "Aug"
      Time.Sep -> "Sep"
      Time.Oct -> "Oct"
      Time.Nov -> "Noc"
      Time.Dec -> "Dec"

parseTimestamp : Int -> String
parseTimestamp stamp =
  let
    posix = Time.millisToPosix stamp
    day = String.fromInt (Time.toDay Time.utc posix)
    month = stampToMonth stamp
    year = String.fromInt (Time.toYear Time.utc posix)
  in
    month ++ " " ++ day ++ ", " ++ year
