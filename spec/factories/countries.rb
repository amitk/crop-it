FactoryBot.define do
  factory :country do
    name { "India" }
    code { "IND" }
    population { 1380004385 }
    currencies { ["INR"] }
    languages { ["eng", "hin", "tam", "english", "hindi", "tamil"] }
    data {
      {"car"=>{"side"=>"left", "signs"=>["IND"]},
       "idd"=>{"root"=>"+9", "suffixes"=>["1"]},
       "tld"=>[".in"],
       "area"=>3287590.0,
       "cca2"=>"IN",
       "cca3"=>"IND",
       "ccn3"=>"356",
       "cioc"=>"IND",
       "fifa"=>"IND",
       "flag"=>"🇮🇳",
       "gini"=>{"2011"=>35.7},
       "maps"=>{"googleMaps"=>"https://goo.gl/maps/WSk3fLwG4vtPQetp7", "openStreetMaps"=>"https://www.openstreetmap.org/relation/304716"},
       "name"=>
        {"common"=>"India",
         "official"=>"Republic of India",
         "nativeName"=>
          {"eng"=>{"common"=>"India", "official"=>"Republic of India"},
           "hin"=>{"common"=>"भारत", "official"=>"भारत गणराज्य"},
           "tam"=>{"common"=>"இந்தியா", "official"=>"இந்தியக் குடியரசு"}}},
       "flags"=>
        {"alt"=>
          "The flag of India is composed of three equal horizontal bands of saffron, white and green. A navy blue wheel with twenty-four spokes — the Ashoka Chakra — is centered in the white band.",
         "png"=>"https://flagcdn.com/w320/in.png",
         "svg"=>"https://flagcdn.com/in.svg"},
       "latlng"=>[20.0, 77.0],
       "region"=>"Asia",
       "status"=>"officially-assigned",
       "borders"=>["BGD", "BTN", "MMR", "CHN", "NPL", "PAK"],
       "capital"=>["New Delhi"],
       "demonyms"=>{"eng"=>{"f"=>"Indian", "m"=>"Indian"}, "fra"=>{"f"=>"Indienne", "m"=>"Indien"}},
       "unMember"=>true,
       "languages"=>{"eng"=>"English", "hin"=>"Hindi", "tam"=>"Tamil"},
       "subregion"=>"Southern Asia",
       "timezones"=>["UTC+05:30"],
       "coatOfArms"=>{"png"=>"https://mainfacts.com/media/images/coats_of_arms/in.png", "svg"=>"https://mainfacts.com/media/images/coats_of_arms/in.svg"},
       "continents"=>["Asia"],
       "currencies"=>{"INR"=>{"name"=>"Indian rupee", "symbol"=>"₹"}},
       "landlocked"=>false,
       "population"=>1380004385,
       "postalCode"=>{"regex"=>"^(\\d{6})$", "format"=>"######"},
       "capitalInfo"=>{"latlng"=>[28.6, 77.2]},
       "independent"=>true,
       "startOfWeek"=>"monday",
       "altSpellings"=>["IN", "Bhārat", "Republic of India", "Bharat Ganrajya", "இந்தியா"],
       "translations"=>
        {"ara"=>{"common"=>"الهند", "official"=>"جمهورية الهند"},
         "bre"=>{"common"=>"India", "official"=>"Republik India"},
         "ces"=>{"common"=>"Indie", "official"=>"Indická republika"},
         "cym"=>{"common"=>"India", "official"=>"Republic of India"},
         "deu"=>{"common"=>"Indien", "official"=>"Republik Indien"},
         "est"=>{"common"=>"India", "official"=>"India Vabariik"},
         "fin"=>{"common"=>"Intia", "official"=>"Intian tasavalta"},
         "fra"=>{"common"=>"Inde", "official"=>"République de l'Inde"},
         "hrv"=>{"common"=>"Indija", "official"=>"Republika Indija"},
         "hun"=>{"common"=>"India", "official"=>"Indiai Köztársaság"},
         "ita"=>{"common"=>"India", "official"=>"Repubblica dell'India"},
         "jpn"=>{"common"=>"インド", "official"=>"インド共和国"},
         "kor"=>{"common"=>"인도", "official"=>"인도 공화국"},
         "nld"=>{"common"=>"India", "official"=>"Republiek India"},
         "per"=>{"common"=>"هند", "official"=>"جمهوری هندوستان"},
         "pol"=>{"common"=>"Indie", "official"=>"Republika Indii"},
         "por"=>{"common"=>"Índia", "official"=>"República da Índia"},
         "rus"=>{"common"=>"Индия", "official"=>"Республика Индия"},
         "slk"=>{"common"=>"India", "official"=>"Indická republika"},
         "spa"=>{"common"=>"India", "official"=>"República de la India"},
         "srp"=>{"common"=>"Индија", "official"=>"Република Индија"},
         "swe"=>{"common"=>"Indien", "official"=>"Republiken Indien"},
         "tur"=>{"common"=>"Hindistan", "official"=>"Hindistan Cumhuriyeti"},
         "urd"=>{"common"=>"بھارت", "official"=>"جمہوریہ بھارت"},
         "zho"=>{"common"=>"印度", "official"=>"印度共和国"}}}
    }
  end
end
