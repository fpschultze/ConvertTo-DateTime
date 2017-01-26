<#
  .Synopsis
  Converts a date string to DateTime object.

  .DESCRIPTION
  Converts the specified string representation of a date and time to its DateTime equivalent.

  .EXAMPLE
  '19.05.2016' | ConvertTo-DateTime

  .EXAMPLE
  '05.19.2016' | ConvertTo-DateTime -Format 'MM.dd.yyyy'
#>
function ConvertTo-DateTime
{
  [CmdletBinding()]
  [OutputType([datetime])]
  param
  (
    # String representation of a date/time
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String]
    $DateString,

    # An array of allowable formats of DateString.
    [Parameter()]
    [String[]]
    $Format
  )
  $OutputObject = Get-Date
  $Result = [datetime]::TryParseExact($DateString,
    $Format,
      [System.Globalization.DateTimeFormatInfo]::InvariantInfo,
        [System.Globalization.DateTimeStyles]::None,
          [ref]$OutputObject)
  if ($Result)
  {
    $OutputObject
  }
}
