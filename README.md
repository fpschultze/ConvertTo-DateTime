[![Build status](https://ci.appveyor.com/api/projects/status/9wr0vfb3qfgy4lc7?svg=true)](https://ci.appveyor.com/project/fpschultze/convertto-datetime)

# ConvertTo-DateTime PowerShell Function
  .Synopsis
  Converts a date string to DateTime object.

  .DESCRIPTION
  Converts the specified string representation of a date and time to its DateTime equivalent.

  .EXAMPLE
  '19.05.2016' | ConvertTo-DateTime

  .EXAMPLE
  '05.19.2016' | ConvertTo-DateTime -Format 'MM.dd.yyyy'