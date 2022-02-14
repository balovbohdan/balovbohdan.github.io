module Site exposing (config)

import Head
import Route
import DataSource
import Pages.Manifest
import SiteConfig

type alias Data = ()

config : SiteConfig.SiteConfig Data
config =
  { data = data
  , manifest = manifest
  , head = head
  , canonicalUrl = "https://balovbohdan.github.io/"
  }

data : DataSource.DataSource Data
data = DataSource.succeed ()

head : Data -> List Head.Tag
head static = [ Head.sitemapLink "/sitemap.xml" ]

manifest : Data -> Pages.Manifest.Config
manifest static =
  Pages.Manifest.init
    { name = "Mr. Balov | Software Development Blog"
    , description = "Software Development Blog by Mr. Balov"
    , startUrl = Route.Index |> Route.toPath
    , icons = []
    }
