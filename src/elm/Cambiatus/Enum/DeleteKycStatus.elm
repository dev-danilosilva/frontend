-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Cambiatus.Enum.DeleteKycStatus exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Enum status for deleting KYC

  - Error - KYC deletion failed
  - Success - KYC deletion succeeded

-}
type DeleteKycStatus
    = Error
    | Success


list : List DeleteKycStatus
list =
    [ Error, Success ]


decoder : Decoder DeleteKycStatus
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ERROR" ->
                        Decode.succeed Error

                    "SUCCESS" ->
                        Decode.succeed Success

                    _ ->
                        Decode.fail ("Invalid DeleteKycStatus type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : DeleteKycStatus -> String
toString enum =
    case enum of
        Error ->
            "ERROR"

        Success ->
            "SUCCESS"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe DeleteKycStatus
fromString enumString =
    case enumString of
        "ERROR" ->
            Just Error

        "SUCCESS" ->
            Just Success

        _ ->
            Nothing
