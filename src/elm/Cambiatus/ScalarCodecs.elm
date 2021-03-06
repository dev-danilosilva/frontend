-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Cambiatus.ScalarCodecs exposing (..)

import Cambiatus.Scalar exposing (defaultCodecs)
import Json.Decode as Decode exposing (Decoder)


type alias Date =
    Cambiatus.Scalar.Date


type alias DateTime =
    Cambiatus.Scalar.DateTime


type alias Id =
    Cambiatus.Scalar.Id


type alias NaiveDateTime =
    Cambiatus.Scalar.NaiveDateTime


codecs : Cambiatus.Scalar.Codecs Date DateTime Id NaiveDateTime
codecs =
    Cambiatus.Scalar.defineCodecs
        { codecDate = defaultCodecs.codecDate
        , codecDateTime = defaultCodecs.codecDateTime
        , codecId = defaultCodecs.codecId
        , codecNaiveDateTime = defaultCodecs.codecNaiveDateTime
        }
