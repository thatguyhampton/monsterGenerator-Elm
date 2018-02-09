module App exposing (app)
import Html
import Html.Attributes
import Html.Events

app = Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  { name: String
  , size: Size
  , mtype: Mtype
  , tag: Tag
  , alignment: Alignment
  , armorClass: Int
  , hitPoints: String
  , speed: Int
  }

model : Model
model =
  { name = ""
  , size = Medium
  , mtype = Other
  , tag = None
  , alignment = TrueNeutral
  , armorClass = 10
  , hitPoints = ""
  , speed = 30
  }

type Size = Tiny | Small | Medium | Large | Huge | Gargantuan

sizeWithLabel : List ( Size, String )
sizeWithLabel =
  [ ( Tiny, "Tiny" )
  , ( Small, "Small" )
  , ( Medium, "Medium" )
  , ( Large, "Large" )
  , ( Huge, "Huge" )
  , ( Gargantuan, "Gargantuan" )
  ]

type Mtype = Other | Aberration | Beast | Celestial | Construct | Dragon | Elemental
  | Fey | Fiend | Giant | Humanoid | Monstrosity | Ooze | Plant | Undead

typeWithLabel : List ( Mtype, String )
typeWithLabel =
  [ ( Other, "Other")
  , ( Aberration, "Aberration" )
  , ( Beast, "Beast" )
  , ( Celestial, "Celestial" )
  , ( Construct, "Construct" )
  , ( Dragon, "Dragon" )
  , ( Elemental, "Elemental" )
  , ( Fey, "Fey" )
  , ( Fiend, "Fiend" )
  , ( Giant, "Giant" )
  , ( Humanoid, "Humanoid" )
  , ( Monstrosity, "Monstrosity" )
  , ( Ooze, "Ooze" )
  , ( Plant, "Plant" )
  , ( Undead, "Undead" )
  ]

type Tag = None | Aarakocra | Bullywug | Demon | Devil | Dwarf | Elf | Gith
  | Gnoll | Gnome | Goblinoid | Grimlock | Human
  | Kenku | Kobold | KuoToa | Lizardfolk | Merfolk | Orc | Quaggoth | Sahuagin
  | Shapechanger | ThriKreen | Titan | Troglodyte | YuanTi | Yugoloth

tagWithLabel : List ( Tag, String )
tagWithLabel =
  [ ( None, "None" )
  , ( Aarakocra, "Aarakocra" )
  , ( Bullywug, "Bullywug" )
  , ( Demon, "Demon" )
  , ( Devil, "Devil" )
  , ( Dwarf, "Dwarf" )
  , ( Elf, "Elf" )
  , ( Gith, "Gith" )
  , ( Gnoll, "Gnoll" )
  , ( Gnome, "Gnome" )
  , ( Goblinoid, "Goblinoid" )
  , ( Grimlock, "Grimlock" )
  , ( Human, "Human" )
  , ( Kenku, "Kenku" )
  , ( Kobold, "Kobold" )
  , ( KuoToa, "Kuo-Toa" )
  , ( Lizardfolk, "Lizardfolk" )
  , ( Merfolk, "Merfolk" )
  , ( Orc, "Orc" )
  , ( Quaggoth, "Quaggoth" )
  , ( Sahuagin, "Sahuagin" )
  , ( Shapechanger, "Shapechanger" )
  , ( ThriKreen, "Thri-Kreen" )
  , ( Titan, "Titan" )
  , ( Troglodyte, "Troglodyte" )
  , ( YuanTi, "Yuan-Ti" )
  , ( Yugoloth, "Yugoloth" )
  ]

type Alignment = LawfulGood | LawfulNeutral | LawfulEvil | NeutralGood
  | TrueNeutral | NeutralEvil | ChaoticGood | ChaoticNeutral | ChaoticEvil

alignmentWithLabel : List ( Alignment, String )
alignmentWithLabel =
  [ ( LawfulGood, "Lawful Good" )
  , ( LawfulNeutral, "Lawful Neutral" )
  , ( LawfulEvil, "Lawful Evil" )
  , ( NeutralGood, "Neutral Good" )
  , ( TrueNeutral, "True Neutral" )
  , ( NeutralEvil, "Neutral Evil" )
  , ( ChaoticGood, "Chaotic Good" )
  , ( ChaoticNeutral, "Chaotic Neutral" )
  , ( ChaoticEvil, "Chaotic Evil" )
  ]

-- UPDATE

type Msg
  = UpdateName String
  | UpdateSize Size
  | UpdateType Mtype
  | UpdateTag Tag
  | UpdateAlignment Alignment
  | UpdateArmorClass String
  | UpdateHitPoints String
  | UpdateSpeed String

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateName name ->
      { model | name = name }

    UpdateSize size ->
      { model | size = size }

    UpdateType mtype ->
      { model | mtype = mtype }

    UpdateTag tag ->
      { model | tag = tag }

    UpdateAlignment alignment ->
      { model | alignment = alignment }

    UpdateArmorClass string ->
      case String.toInt string of
        Result.Err str -> model
        Ok number -> { model | armorClass = number }

    UpdateHitPoints hitPoints ->
      { model | hitPoints = hitPoints }

    UpdateSpeed string ->
      case String.toInt string of
        Result.Err str -> model
        Ok number -> { model | speed = number }

-- VIEW

view : Model -> Html.Html Msg
view model =
  Html.div []
  [ Html.input
    [ Html.Attributes.value model.name
    , Html.Attributes.placeholder "Name"
    , Html.Events.onInput UpdateName
    ] []
  , selectAndLabel "Size" sizeWithLabel model.size UpdateSize
  , selectAndLabel "Type" typeWithLabel model.mtype UpdateType
  , selectAndLabel "Tag" tagWithLabel model.tag UpdateTag
  , selectAndLabel "Alignment" alignmentWithLabel model.alignment UpdateAlignment
  , inputAndLabel "Armor Class" (toString model.armorClass) UpdateArmorClass "number"
  , inputAndLabel "Hit Points" model.hitPoints UpdateHitPoints "text"
  , inputAndLabel "Speed" (toString model.speed) UpdateSpeed "number"
  ]

inputAndLabel : String -> String -> (String -> Msg) -> String -> Html.Html Msg
inputAndLabel label currentValue update inputType =
  Html.div []
  [ Html.label [] [Html.text label]
  , Html.input
    [ Html.Attributes.value currentValue
    , Html.Events.onInput update
    , Html.Attributes.type_ inputType
    ] []
  ]

selectAndLabel : String -> List ( a, String ) -> a -> (a -> Msg) -> Html.Html Msg
selectAndLabel label valuesWithLabels currentValue update =
  Html.div []
  [ Html.label [] [Html.text label]
  , selectFromValuesWithLabels valuesWithLabels currentValue update
  ]

selectFromValuesWithLabels : List ( a, String ) -> a -> (a -> Msg) -> Html.Html Msg
selectFromValuesWithLabels valuesWithLabels currentValue update =
  let
    optionForTuple ( value, label ) =
      let ignoreInput (string) = update value
      in
        Html.option
          [ Html.Attributes.selected (currentValue == value)
          , Html.Events.onInput ignoreInput
          ]
          [ Html.text label ]

    options valuesWithLabels currentValue =
      List.map optionForTuple valuesWithLabels
  in
    Html.select
      []
      (options valuesWithLabels currentValue)
