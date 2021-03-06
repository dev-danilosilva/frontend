module View.Form.Select exposing (disable, enable, init, toHtml, withOption)

{- | Creates a Cambiatus-style dropdown

   View.Form.Select.init "country_select" "Country" EnteredCountry
       |> View.Form.Select.withOption { value = "brasil", label = "Brasil" }
       |> View.Form.Select.withOption { value = "costa_rica", label = "Costa Rica" }
       |> View.Form.Select.withOption { value = "argentina", label = "Argentina" }
       |> View.Form.Select.toHtml

-}

import Html exposing (Html, li, text, ul)
import Html.Attributes exposing (class, disabled, selected, value)
import Html.Events exposing (onInput)
import View.Form


{-| Initializes a Cambiatus-style dropdown
-}
init : String -> String -> (String -> a) -> String -> Maybe (List String) -> Select a
init id label onInput value problems =
    { options = [], onInput = onInput, id = id, label = label, value = value, disabled = False, problems = problems }


disable : Select a -> Select a
disable select =
    { select | disabled = True }


enable : Select a -> Select a
enable select =
    { select | disabled = False }


{-| Adds a new option field to a dropdown

    View.Form.Select.withOption { value = "brasil", label = "Brasil" } mySelect

-}
withOption : Option -> Select a -> Select a
withOption option select =
    let
        html =
            Html.option
                [ value option.value
                , selected
                    (if select.value == option.value then
                        True

                     else
                        False
                    )
                ]
                [ text option.label ]
    in
    { select | options = html :: select.options }


{-| Converts a Cambiatus-style dropdown into Html to be used in view code
-}
toHtml : Select a -> Html a
toHtml select =
    Html.div [ class "mb-10" ]
        [ View.Form.label select.id select.label
        , Html.select [ class "form-select select w-full", onInput select.onInput, disabled select.disabled ] select.options
        , ul []
            (select.problems
                |> Maybe.withDefault []
                |> List.map viewFieldProblem
            )
        ]



--- INTERNAL


type alias Select a =
    { options : List (Html a)
    , onInput : String -> a
    , label : String
    , id : String
    , value : String
    , disabled : Bool
    , problems : Maybe (List String)
    }


type alias Option =
    { value : String
    , label : String
    }


viewFieldProblem : String -> Html a
viewFieldProblem problem =
    li [ class "form-error absolute mr-8" ] [ text problem ]
