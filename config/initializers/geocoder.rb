Geocoder.configure(
  # street address geocoding service (default :nominatim)
  lookup: :yandex,

  # IP address geocoding service (default :ipinfo_io)
  ip_lookup: :maxmind,

  # to use an API key:
  api_key: "62a48d71-ef71-4459-a888-8d1994286d40",

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km,
)