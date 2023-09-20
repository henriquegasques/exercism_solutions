module Test.Generated.Main exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 53996887883113
        , processes = 8
        , globs =
            []
        , paths =
            [ "/home/gasks/workspace/exercism/elm/accumulate/tests/Tests.elm"
            ]
        }
        [ ( "Tests"
          , [ Test.Runner.Node.check Tests.square
            , Test.Runner.Node.check Tests.tests
            ]
          )
        ]