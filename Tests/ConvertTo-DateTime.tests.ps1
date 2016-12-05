$ScriptRoot = Split-Path -Parent $PSScriptRoot
$ScriptFile = (Split-Path -Leaf $PSCommandPath) -replace '\.tests\.ps1$', '.ps1'
. "$ScriptRoot\$ScriptFile"

Describe 'ConvertTo-DateTime Function' {

  $DefaultFormatTestCase = @(
    @{DateString = '20161213'}   # yyyyMMdd
    @{DateString = '2016-12-13'} # yyyy-MM-dd
    @{DateString = '13.12.2016'} # dd.MM.yyyy
  )
  $NonDefaultFormatTestCase = @{
    DateString = '12.13.2016'
    Format = 'MM.dd.yyyy'
  }

  It 'running tests against default formats return DateTime' -TestCases $DefaultFormatTestCase {
    param ($DateString, $Format)
    (ConvertTo-DateTime @PSBoundParameters).GetType().Name | Should Be 'DateTime'
  }

  It 'running test against non-default format returns nothing' {
    ConvertTo-DateTime $NonDefaultFormatTestCase.DateString | Should BeNullOrEmpty
  }

  It 'running test against specified format returns DateTime object' {
    (ConvertTo-DateTime @NonDefaultFormatTestCase).GetType().Name | Should Be 'DateTime'
  }

}
