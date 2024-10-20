module Main exposing (Model, Msg, main)

import Browser
import Html exposing (Html, sub)
import Html.Attributes as Attrs
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }


type alias Model =
    Int



-- INIT


type alias Flags =
    ()


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( 0, Cmd.none )


type Msg
    = Increment
    | Decrement



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    Html.div [ Attrs.class "h-screen flex items-center justify-center" ]
        [ Html.div [ Attrs.class "border-gray-300 border border-dashed mx-4 md:mx-0" ]
            [ Html.div [ Attrs.class "border-b border-dashed border-gray-300 p-4" ]
                [ Html.p [ Attrs.class "text-lg font-serif font-medium" ]
                    [ Html.text "Elm Vite Template" ]
                ]
            , Html.div [ Attrs.class "flex items-center" ]
                [ Html.a
                    [ Attrs.class "block w-24 h-24 p-4 border-r border-dashed border-gray-300 hover:bg-gray-50"
                    , Attrs.href "https://elm-lang.org/"
                    , Attrs.target "_blank"
                    , Attrs.title "Visit Elm's documentation"
                    ]
                    [ Html.img [ Attrs.src "/assets/elm.png", Attrs.alt "Elm's logo" ] [] ]
                , Html.div [ Attrs.class "flex p-4 items-center gap-4" ]
                    [ Html.button
                        [ onClick Decrement
                        , Attrs.class "py-3 px-5 bg-pink-400 rounded text-white hover:bg-pink-400/90"
                        ]
                        [ Html.text "-" ]
                    , Html.div [ Attrs.class "text-center" ] [ Html.text <| String.fromInt model ]
                    , Html.button
                        [ onClick Increment
                        , Attrs.class "py-3 px-5 bg-indigo-400 rounded text-white hover:bg-indigo-400/90"
                        ]
                        [ Html.text "+" ]
                    ]
                ]
            ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
