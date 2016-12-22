<#PSScriptInfo

.VERSION 1.0.3

.GUID ded1648a-96e1-4b08-b8bb-bc774c27f272

.AUTHOR Frank Peter Schultze

.COMPANYNAME www.out-web.net

.COPYRIGHT 

.TAGS Type Conversion DateTime

.LICENSEURI 

.PROJECTURI https://github.com/fpschultze/ConvertTo-DateTime/

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
Added PSScriptInfo

#>

<#
  .SYNOPSIS
  Converts a date string to DateTime object.

  .DESCRIPTION
  Tries to convert the specified string representation of a date and time to its DateTime equivalent.

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
    $Format = ('yyyyMMdd', 'yyyy-MM-dd', 'dd.MM.yyyy')
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
