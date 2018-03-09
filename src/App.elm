module App exposing (app)
import Html
import Html.Attributes
import Html.Events
import Dict
import Set

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
  , skills : Dict.Dict Int Int
  , skillToAdd : Skill
  , skillValue : Int
  , vulnerabilities : Set.Set Int
  , vulnerabilityToAdd : DamageType
  , resistances : Set.Set Int
  , resistanceToAdd : DamageType
  , immunities : Set.Set Int
  , immunityToAdd : DamageType
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
  , skills = Dict.empty
  , skillToAdd = Acrobatics
  , skillValue = 0
  , vulnerabilities = Set.empty
  , vulnerabilityToAdd = Acid
  , resistances = Set.empty
  , resistanceToAdd = Acid
  , immunities = Set.empty
  , immunityToAdd = Acid
  }

type Skill = Acrobatics | AnimalHandling | Arcana | Athletics | Deception
  | History | Insight | Intimidation | Investigation | Medicine | Nature
  | Perception | Performance | Persuasion | Religion | SleightOfHand
  | Stealth | Survival

allSkills : List Skill
allSkills =
  [ Acrobatics
  , AnimalHandling
  , Arcana
  , Athletics
  , Deception
  , History
  , Insight
  , Intimidation
  , Investigation
  , Medicine
  , Nature
  , Perception
  , Performance
  , Persuasion
  , Religion
  , SleightOfHand
  , Stealth
  , Survival
  ]

skillLabel : Skill -> String
skillLabel skill =
  case skill of
    Acrobatics -> "Acrobatics"
    AnimalHandling -> "Animal Handling"
    Arcana -> "Arcana"
    Athletics -> "Athletics"
    Deception -> "Deception"
    History -> "History"
    Insight -> "Insight"
    Intimidation -> "Intimidation"
    Investigation -> "Investigation"
    Medicine -> "Medicine"
    Nature -> "Nature"
    Perception -> "Perception"
    Performance -> "Performance"
    Persuasion -> "Persuasion"
    Religion -> "Religion"
    SleightOfHand -> "Sleight Of Hand"
    Stealth -> "Stealth"
    Survival -> "Survival"

toInt : Skill -> Int
toInt skill =
  case skill of
    Acrobatics -> 0
    AnimalHandling -> 1
    Arcana -> 2
    Athletics -> 3
    Deception -> 4
    History -> 5
    Insight -> 6
    Intimidation -> 7
    Investigation -> 8
    Medicine -> 9
    Nature -> 10
    Perception -> 11
    Performance -> 12
    Persuasion -> 13
    Religion -> 14
    SleightOfHand -> 15
    Stealth -> 16
    Survival -> 17

fromInt : Int -> Skill
fromInt skill =
  case skill of
    0 -> Acrobatics
    1 -> AnimalHandling
    2 -> Arcana
    3 -> Athletics
    4 -> Deception
    5 -> History
    6 -> Insight
    7 -> Intimidation
    8 -> Investigation
    9 -> Medicine
    10 -> Nature
    11 -> Perception
    12 -> Performance
    13 -> Persuasion
    14 -> Religion
    15 -> SleightOfHand
    16 -> Stealth
    17 -> Survival
    _ -> Acrobatics

skillWithLabel : List ( Skill, String )
skillWithLabel =
  allSkills
  |> List.map (\skill -> (skill, skillLabel skill))

type DamageType = Acid | Bludgeoning | Cold | Fire | Force | Lightning |
  Necrotic | Piercing | Poison | Psychic | Radiant | Slashing | Thunder

damageTypes : List DamageType
damageTypes =
  [ Acid
  , Bludgeoning
  , Cold
  , Fire
  , Force
  , Lightning
  , Necrotic
  , Piercing
  , Poison
  , Psychic
  , Radiant
  , Slashing
  , Thunder
  ]

damageTypeToInt : DamageType -> Int
damageTypeToInt damageType =
  case damageType of
    Acid -> 0
    Bludgeoning -> 1
    Cold -> 2
    Fire -> 3
    Force -> 4
    Lightning -> 5
    Necrotic -> 6
    Piercing -> 7
    Poison -> 8
    Psychic -> 9
    Radiant -> 10
    Slashing -> 11
    Thunder -> 12

damageTypeFromInt : Int -> DamageType
damageTypeFromInt damageType =
  case damageType of
    0 -> Acid
    1 -> Bludgeoning
    2 -> Cold
    3 -> Fire
    4 -> Force
    5 -> Lightning
    6 -> Necrotic
    7 -> Piercing
    8 -> Poison
    9 -> Psychic
    10 -> Radiant
    11 -> Slashing
    12 -> Thunder
    _ -> Fire

damageTypeLabel : DamageType -> String
damageTypeLabel damageType =
  case damageType of
    Acid -> "Acid"
    Bludgeoning -> "Bludgeoning"
    Cold -> "Cold"
    Fire -> "Fire"
    Force -> "Force"
    Lightning -> "Lightning"
    Necrotic -> "Necrotic"
    Piercing -> "Piercing"
    Poison -> "Poison"
    Psychic -> "Psychic"
    Radiant -> "Radiant"
    Slashing -> "Slashing"
    Thunder -> "Thunder"

damageTypeWithLabel : List ( DamageType, String )
damageTypeWithLabel =
  damageTypes
  |> List.map (\damageType -> (damageType, damageTypeLabel damageType))

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
  | UpdateSkillToAdd Skill
  | AddSkill
  | UpdateSkillValue String
  | UpdateVulnerabilityToAdd DamageType
  | AddVulnerability
  | UpdateResistanceToAdd DamageType
  | AddResistance
  | UpdateImmunityToAdd DamageType
  | AddImmunity

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

    UpdateSkillToAdd skill ->
      { model | skillToAdd = skill }

    AddSkill ->
      { model | skills =
        if model.skillValue /= 0 then
          Dict.insert (toInt model.skillToAdd) model.skillValue model.skills
        else
          Dict.remove (toInt model.skillToAdd) model.skills
         }

    UpdateSkillValue string ->
      { model | skillValue = unwrapInt model.skillValue string }

    UpdateVulnerabilityToAdd damageType ->
      { model | vulnerabilityToAdd = damageType }

    AddVulnerability ->
      { model | vulnerabilities = Set.insert (damageTypeToInt model.vulnerabilityToAdd) model.vulnerabilities }

    UpdateResistanceToAdd damageType ->
      { model | resistanceToAdd = damageType }

    AddResistance ->
      { model | resistances = Set.insert (damageTypeToInt model.resistanceToAdd) model.resistances }

    UpdateImmunityToAdd damageType ->
      { model | immunityToAdd = damageType }

    AddImmunity ->
      { model | immunities = Set.insert (damageTypeToInt model.immunityToAdd) model.immunities }

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
    , Html.p [] [ Html.text "Skills" ]
    , selectNewSkill model
    , Html.p [] [ Html.text "Vulnerabilities" ]
    , selectNewVulnerability model
    , Html.p [] [ Html.text "Resistances" ]
    , selectNewResistance model
    , Html.p [] [ Html.text "Immunities" ]
    , selectNewImmunity model
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

selectNewVulnerability : Model -> Html.Html Msg
selectNewVulnerability model =
  Html.div []
  [ Html.ul []
    ( Set.toList model.vulnerabilities
    |> List.map damageTypeFromInt
    |> List.map (\damageType -> Html.li [] [ Html.text <| damageTypeLabel <| damageType ]) )
  , selectFromValuesWithLabels damageTypeWithLabel model.vulnerabilityToAdd UpdateVulnerabilityToAdd
  , Html.button
    [ Html.Attributes.type_ "button"
    , Html.Events.onClick AddVulnerability
    ]
    [ Html.text "Add Vulnerability" ]
  ]

selectNewResistance : Model -> Html.Html Msg
selectNewResistance model =
  Html.div []
  [ Html.ul []
    ( Set.toList model.resistances
    |> List.map damageTypeFromInt
    |> List.map (\damageType -> Html.li [] [ Html.text <| damageTypeLabel <| damageType ]) )
  , selectFromValuesWithLabels damageTypeWithLabel model.resistanceToAdd UpdateResistanceToAdd
  , Html.button
    [ Html.Attributes.type_ "button"
    , Html.Events.onClick AddResistance
    ]
    [ Html.text "Add Resistance" ]
  ]

selectNewImmunity : Model -> Html.Html Msg
selectNewImmunity model =
  Html.div []
  [ Html.ul []
    ( Set.toList model.immunities
    |> List.map damageTypeFromInt
    |> List.map (\damageType -> Html.li [] [ Html.text <| damageTypeLabel <| damageType ]) )
  , selectFromValuesWithLabels damageTypeWithLabel model.immunityToAdd UpdateImmunityToAdd
  , Html.button
    [ Html.Attributes.type_ "button"
    , Html.Events.onClick AddImmunity
    ]
    [ Html.text "Add Immunity" ]
  ]

selectNewSkill : Model -> Html.Html Msg
selectNewSkill model =
  Html.div []
  [ Html.ul []
    (listSkills model.skills)
  , selectFromValuesWithLabels skillWithLabel model.skillToAdd UpdateSkillToAdd
  , Html.input
    [ Html.Attributes.value <| toString model.skillValue
    , Html.Events.onInput UpdateSkillValue
    , Html.Attributes.type_ "number"
    ] []
  , Html.button
    [ Html.Attributes.type_ "button"
    , Html.Events.onClick AddSkill
    ]
    [ Html.text "Add Skill" ]
  ]

listSkills : Dict.Dict Int Int -> List (Html.Html Msg)
listSkills dict =
  Dict.toList dict
  |> List.map (\(skillInt, value) -> (fromInt skillInt, value))
  |> List.map (\(skill, value) -> (skillLabel skill, value))
  |> List.map (\(label, value) -> Html.li [] [Html.text <| label ++ " " ++ toString value])

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
