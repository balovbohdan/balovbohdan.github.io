module Components.ThemeToggler exposing (themeToggler)

import Html.Styled exposing (Html)

import Core.Model.Types exposing (Model)
import Core.Message exposing (Message(..))
import Components.Toggler exposing (toggler)

type alias Props = { model: Model, checked: Bool }

onCheck : Bool -> Message
onCheck isChecked =
  if isChecked then
    (MessageColorSchemaToggled "dark")
  else
    (MessageColorSchemaToggled "light")

themeToggler : Props -> Html Message
themeToggler props =
  toggler
    { model = props.model
    , onCheck = onCheck
    , checked = props.checked
    }
