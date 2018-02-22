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
  , swim: Int
  , fly: Int
  , hover: Bool
  , burrow: Int
  , climb: Int
  , abilityStr: Int
  , abilityDex: Int
  , abilityCon: Int
  , abilityInt: Int
  , abilityWis: Int
  , abilityCha: Int
  , saveStr: Int
  , saveDex: Int
  , saveCon: Int
  , saveInt: Int
  , saveWis: Int
  , saveCha: Int
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
  , swim = 0
  , fly = 0
  , hover = False
  , burrow = 0
  , climb = 0
  , abilityStr = 10
  , abilityDex = 10
  , abilityCon = 10
  , abilityInt = 10
  , abilityWis = 10
  , abilityCha = 10
  , saveStr = 0
  , saveDex = 0
  , saveCon = 0
  , saveInt = 0
  , saveWis = 0
  , saveCha = 0
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

sizeToString : Size -> String
sizeToString size =
  case size of
    Tiny -> "Tiny"
    Small -> "Small"
    Medium -> "Medium"
    Large -> "Large"
    Huge -> "Huge"
    Gargantuan -> "Gargantuan"

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

typeToString : Mtype -> String
typeToString mtype =
  case mtype of
      Other -> "Other"
      Aberration -> "Aberration"
      Beast -> "Beast"
      Celestial -> "Celestial"
      Construct -> "Construct"
      Dragon -> "Dragon"
      Elemental -> "Elemental"
      Fey -> "Fey"
      Fiend -> "Fiend"
      Giant -> "Giant"
      Humanoid -> "Humanoid"
      Monstrosity -> "Monstrosity"
      Ooze -> "Ooze"
      Plant -> "Plant"
      Undead -> "Undead"

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

tagToString : Tag -> String
tagToString tag =
  case tag of
    None -> "None"
    Aarakocra -> "Aarakocra"
    Bullywug -> "Bullywug"
    Demon -> "Demon"
    Devil -> "Devil"
    Dwarf -> "Dwarf"
    Elf -> "Elf"
    Gith -> "Gith"
    Gnoll -> "Gnoll"
    Gnome -> "Gnome"
    Goblinoid -> "Goblinoid"
    Grimlock -> "Grimlock"
    Human -> "Human"
    Kenku -> "Kenku"
    Kobold -> "Kobold"
    KuoToa -> "Kuo-Toa"
    Lizardfolk -> "Lizardfolk"
    Merfolk -> "Merfolk"
    Orc -> "Orc"
    Quaggoth -> "Quaggoth"
    Sahuagin -> "Sahuagin"
    Shapechanger -> "Shapechanger"
    ThriKreen -> "Thri-Kreen"
    Titan -> "Titan"
    Troglodyte -> "Troglodyte"
    YuanTi -> "Yuan-Ti"
    Yugoloth -> "Yugoloth"

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

alignmentToString : Alignment -> String
alignmentToString alignment =
  case alignment of
    LawfulGood -> "Lawful Good"
    LawfulNeutral -> "Lawful Neutral"
    LawfulEvil -> "Lawful Evil"
    NeutralGood -> "Neutral Good"
    TrueNeutral -> "True Neutral"
    NeutralEvil -> "Neutral Evil"
    ChaoticGood -> "Chaotic Good"
    ChaoticNeutral -> "Chaotic Neutral"
    ChaoticEvil -> "Chaotic Evil"

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
  | UpdateSwim String
  | UpdateFly String
  | UpdateHover Bool
  | UpdateBurrow String
  | UpdateClimb String
  | UpdateAbilityStr String
  | UpdateAbilityDex String
  | UpdateAbilityCon String
  | UpdateAbilityInt String
  | UpdateAbilityWis String
  | UpdateAbilityCha String
  | UpdateSaveStr String
  | UpdateSaveDex String
  | UpdateSaveCon String
  | UpdateSaveInt String
  | UpdateSaveWis String
  | UpdateSaveCha String

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
      { model | armorClass = unwrapInt model.armorClass string }

    UpdateHitPoints hitPoints ->
      { model | hitPoints = hitPoints }

    UpdateSpeed string ->
      { model | speed = unwrapInt model.speed string }

    UpdateSwim string ->
      { model | swim = unwrapInt model.swim string }

    UpdateFly string ->
      { model | fly = unwrapInt model.fly string }

    UpdateHover value ->
      { model | hover = value }

    UpdateBurrow string ->
      { model | burrow = unwrapInt model.burrow string }

    UpdateClimb string ->
      { model | climb = unwrapInt model.climb string }

    UpdateAbilityStr string ->
      { model | abilityStr = unwrapInt model.abilityStr string }

    UpdateAbilityDex string ->
      { model | abilityDex = unwrapInt model.abilityDex string }

    UpdateAbilityCon string ->
      { model | abilityCon = unwrapInt model.abilityCon string }

    UpdateAbilityInt string ->
      { model | abilityInt = unwrapInt model.abilityInt string }

    UpdateAbilityWis string ->
      { model | abilityWis = unwrapInt model.abilityWis string }

    UpdateAbilityCha string ->
      { model | abilityCha = unwrapInt model.abilityCha string }

    UpdateSaveStr string ->
      { model | saveStr = unwrapInt model.saveStr string }

    UpdateSaveDex string ->
      { model | saveDex = unwrapInt model.saveDex string }

    UpdateSaveCon string ->
      { model | saveCon = unwrapInt model.saveCon string }

    UpdateSaveInt string ->
      { model | saveInt = unwrapInt model.saveInt string }

    UpdateSaveWis string ->
      { model | saveWis = unwrapInt model.saveWis string }

    UpdateSaveCha string ->
      { model | saveCha = unwrapInt model.saveCha string }

unwrapInt : Int -> String -> Int
unwrapInt default value =
  case String.toInt value of
    Result.Err str -> default
    Ok number -> number

-- VIEW

view : Model -> Html.Html Msg
view model =
  Html.div [ Html.Attributes.class "app" ]
  [ Html.div [ Html.Attributes.class "config" ]
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
    , inputAndLabel "Swim" (toString model.swim) UpdateSwim "number"
    , inputAndLabel "Fly" (toString model.fly) UpdateFly "number"
    , checkbox "Hover" model.hover UpdateHover
    , inputAndLabel "Burrow" (toString model.burrow) UpdateBurrow "number"
    , inputAndLabel "Climb" (toString model.climb) UpdateClimb "number"
    , Html.p [] [ Html.text "Ability Scores" ]
    , inputAndLabel "STR" (toString model.abilityStr) UpdateAbilityStr "number"
    , inputAndLabel "DEX" (toString model.abilityDex) UpdateAbilityDex "number"
    , inputAndLabel "CON" (toString model.abilityCon) UpdateAbilityCon "number"
    , inputAndLabel "INT" (toString model.abilityInt) UpdateAbilityInt "number"
    , inputAndLabel "WIS" (toString model.abilityWis) UpdateAbilityWis "number"
    , inputAndLabel "CHA" (toString model.abilityCha) UpdateAbilityCha "number"
    , Html.p [] [ Html.text "Saving Throw Bonuses" ]
    , inputAndLabel "STR" (toString model.saveStr) UpdateSaveStr "number"
    , inputAndLabel "DEX" (toString model.saveDex) UpdateSaveDex "number"
    , inputAndLabel "CON" (toString model.saveCon) UpdateSaveCon "number"
    , inputAndLabel "INT" (toString model.saveInt) UpdateSaveInt "number"
    , inputAndLabel "WIS" (toString model.saveWis) UpdateSaveWis "number"
    , inputAndLabel "CHA" (toString model.saveCha) UpdateSaveCha "number"
    ]
  , display model
  ]

display : Model -> Html.Html Msg
display model =
  Html.div [ Html.Attributes.class "display" ]
    [ Html.div [ Html.Attributes.class "card"]
      [ Html.h2 [ Html.Attributes.class "name" ] [ Html.text model.name ]
      , Html.p
        [ Html.Attributes.class "sub-label" ]
        [ Html.text <| displaySubHeader model.size model.mtype model.tag model.alignment ]
      , Html.div [ Html.Attributes.class "divider" ] []
      , displayLabelValue "Armor Class " <| toString <| model.armorClass
      , displayLabelValue "Hit Points " model.hitPoints
      , displayLabelValue "Speed " <| displayDistance <| model.speed
      , displayLabelValue "Swim " <| displayDistance <| model.swim
      , displayLabelValue "Fly " <| displayDistance <| model.fly
      , displayLabelValue "Burrow " <| displayDistance <| model.burrow
      , displayLabelValue "Climb " <| displayDistance <| model.climb
      , Html.div [ Html.Attributes.class "divider" ] []
      , Html.div [ Html.Attributes.class "ability-scores" ]
        [ displayAbilityScore "STR" model.abilityStr
        , displayAbilityScore "DEX" model.abilityDex
        , displayAbilityScore "CON" model.abilityCon
        , displayAbilityScore "INT" model.abilityInt
        , displayAbilityScore "WIS" model.abilityWis
        , displayAbilityScore "CHA" model.abilityCha
        ]
      , Html.div [ Html.Attributes.class "divider" ] []
      , displayLabelValue "Saving Throws " <| displaySavingThrows model
      ]
    ]

displaySavingThrows : Model -> String
displaySavingThrows model =
  let
    savingThrows =
      [ ( model.saveStr, "Str" )
      , ( model.saveDex, "Dex" )
      , ( model.saveCon, "Con" )
      , ( model.saveInt, "Int" )
      , ( model.saveWis, "Wis" )
      , ( model.saveCha, "Cha" )
      ]
    format = (\(value, label) ->
      if value > 0 then
        label ++ " +" ++ toString value
      else if value < 0 then
        label ++ " " ++ toString value
      else
        ""
    )
    filter = (\string ->
      if String.isEmpty string then
        Nothing
      else
        Just string
    )
  in
    savingThrows
    |> List.map format
    |> List.filterMap filter
    |> String.join ", "

displayAbilityScore : String -> Int -> Html.Html Msg
displayAbilityScore label value =
  let
    bonus = floor <| (toFloat value - 10) / 2
    bonusString = if bonus < 0 then toString bonus else "+" ++ toString bonus
    displayValue = toString value ++ " (" ++ bonusString ++ ")"
  in
    Html.div []
      [ Html.p [] [ Html.b [] [ Html.text label ] ]
      , Html.p [] [ Html.text displayValue ]
      ]

displayDistance : Int -> String
displayDistance distance =
  toString distance ++ " ft."

displayLabelValue : String -> String -> Html.Html Msg
displayLabelValue label value =
  Html.p [ Html.Attributes.class "label" ]
    [ Html.b [] [ Html.text label ]
    , Html.text value
    ]

displaySubHeader : Size -> Mtype -> Tag -> Alignment -> String
displaySubHeader size mtype tag alignment =
  case tag of
    None -> sizeToString size ++ " " ++ typeToString mtype ++ ", " ++ alignmentToString alignment
    other -> sizeToString size ++ " " ++ typeToString mtype ++ " (" ++ tagToString tag ++ "), " ++ alignmentToString alignment

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

checkbox : String -> Bool -> (Bool -> Msg) -> Html.Html Msg
checkbox label checked update =
  Html.label []
  [ Html.input
    [ Html.Attributes.value (if checked then "checked" else "")
    , Html.Events.onInput (\str -> update <| not checked)
    , Html.Attributes.type_ "checkbox"
    ]
    []
  , Html.text label
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
    optionForTuple (value, label) =
      Html.option [Html.Attributes.selected (currentValue == value)][Html.text label]

    options valuesWithLabels currentValue =
      List.map optionForTuple valuesWithLabels

    maybeValueFromLabel l =
      List.filter (\( value, label ) -> label == l) valuesWithLabels
        |> List.head

    valueFromLabel label =
      case maybeValueFromLabel label of
        Nothing ->
          currentValue
        Just (value, label) ->
          value
  in
    Html.select
      [ Html.Events.onInput (update << valueFromLabel) ]
      (options valuesWithLabels currentValue)
