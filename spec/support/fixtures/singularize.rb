# frozen_string_literal: true

module Fixtures
  # rubocop:disable Metrics/ModuleLength
  module Singularize
    def self.cases
      CASES
    end

    def self.pending
      PENDING
    end

    # ==== exceptional cases

    CASES = {
      "equipment" => "equipment",
      "mysql" => "mysql",
      "information" => "information",
      "money" => "money",
      "species" => "species",
      "series" => "series",
      "fish" => "fish",
      "sheep" => "sheep",
      "news" => "news",
      "rain" => "rain",
      "milk" => "milk",
      "moose" => "moose",
      "geese" => "goose",
      "hovercraft" => "hovercraft",
      "matrices" => "matrix",
      "lives" => "life",
      "wives" => "wife",
      "aliases" => "alias",
      "statuses" => "status",
      "axes" => "axis",
      "crises" => "crisis",
      "testes" => "testis",
      "children" => "child",
      "people" => "person",
      "potatoes" => "potato",
      "tomatoes" => "tomato",
      "buffaloes" => "buffalo",
      "torpedoes" => "torpedo",
      "quizzes" => "quiz",
      "vertices" => "vertex",
      "indices" => "index",
      "indexes" => "index",
      "oxen" => "ox",
      "mice" => "mouse",
      "lice" => "louse",
      "theses" => "thesis",
      "analyses" => "analysis",
      "octopi" => "octopus",
      "grass" => "grass",
      # ==== bugs, typos and reported issues

      "alias" => "alias",
      "status" => "status",
      "bus" => "bus",
      "axis" => "axis",
      "crisis" => "crisis",
      "testis" => "testis",
      "thesis" => "thesis",
      "analysis" => "analysis",
      "octopuses" => "octopus",
      "pluses" => "plus",
      "cactuses" => "cactus",
      "bonuses" => "bonus",
      "geniuses" => "genius",
      "walruses" => "walrus",

      # ==== rules

      "forums" => "forum",
      "hives" => "hive",
      "athletes" => "athlete",
      "dwarves" => "dwarf",
      "heroes" => "hero",
      "zeroes" => "zero",
      "men" => "man",
      "women" => "woman",
      "sportsmen" => "sportsman",
      "branches" => "branch",
      "crunches" => "crunch",
      "trashes" => "trash",
      "mashes" => "mash",
      "crosses" => "cross",
      "errata" => "erratum",
      # FIXME: add -ia => -ium cases

      # FIXME: add -ra => -rum cases

      "rays" => "ray",
      "sprays" => "spray",
      # Merriam-Webster dictionary says
      # preys is correct, too.
      "preys" => "prey",
      "toys" => "toy",
      "joys" => "joy",
      "buys" => "buy",
      "guys" => "guy",
      "cries" => "cry",
      "flies" => "fly",
      "foxes" => "fox",
      "elves" => "elf",
      "shelves" => "shelf",
      "cats" => "cat",
      "rats" => "rat",
      "roses" => "rose",
      "projects" => "project",
      "posts" => "post",
      "articles" => "article",
      "locations" => "location",
      "friends" => "friend",
      "links" => "link",
      "urls" => "url",
      "accounts" => "account",
      "servers" => "server",
      "fruits" => "fruit",
      "maps" => "map",
      "incomes" => "income",
      "pings" => "ping",
      "events" => "event",
      "proofs" => "proof",
      "typos" => "typo",
      "attachments" => "attachment",
      "downloads" => "download",
      "assets" => "asset",
      "jobs" => "job",
      "cities" => "city",
      "packages" => "package",
      "commits" => "commit",
      "versions" => "version",
      "documents" => "document",
      "editions" => "edition",
      "movies" => "movie",
      "songs" => "song",
      "invoices" => "invoice",
      "products" => "product",
      "books" => "book",
      "tickets" => "ticket",
      "games" => "game",
      "tournaments" => "tournament",
      "prizes" => "prize",
      "prices" => "price",
      "installations" => "installation",
      "dates" => "date",
      "schedules" => "schedule",
      "arenas" => "arena",
      "spams" => "spam",
      "rice" => "rice",

      # ending with 'ss'
      "address" => "address",
      "boss" => "boss",
      "class" => "class",
      "glass" => "glass",
      "kiss" => "kiss",

      # ending with 'sses'
      "addresses" => "address",
      "bosses" => "boss",
      "classes" => "class",
      "glasses" => "glass",
      "kisses" => "kiss",

      # uncountable
      "Swiss" => "Swiss"
    }.freeze

    # Missing exceptions or missing rules?
    PENDING = {
      "cacti" => "cactus",
      "thesauri" => "thesaurus",
      "phenomena" => "phenomenon",
      "drives" => "drive",
      "thieves" => "thief",
      "criteria" => "criterion",
      "postgres" => "postgres"
    }.freeze
  end
  # rubocop:enable Metrics/ModuleLength
end
