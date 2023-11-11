import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import ReuseIdentifiableMacros

let testMacros: [String: Macro.Type] = [
    "ReuseIdentifiable": ReuseIdentifiableMacro.self,
]

final class ReuseIdentifierTests: XCTestCase {
    func testClassExpanded() {
        assertMacroExpansion(
            """
            @ReuseIdentifiable
            class TableViewCell {
            }
            """,
            expandedSource: """
            class TableViewCell {

                static var reuseIdentifier: String {
                    "TableViewCell"
                }
            }
            """,
            macros: testMacros
        )
    }

    func testFinalClassExpanded() {
        assertMacroExpansion(
            """
            @ReuseIdentifiable
            final class TableViewCell {
            }
            """,
            expandedSource: """
            final class TableViewCell {

                static var reuseIdentifier: String {
                    "TableViewCell"
                }
            }
            """,
            macros: testMacros
        )
    }

    func testStructExpanded() {
        assertMacroExpansion(
            """
            @ReuseIdentifiable
            struct TableViewCell {
            }
            """,
            expandedSource: """
            struct TableViewCell {

                static var reuseIdentifier: String {
                    "TableViewCell"
                }
            }
            """,
            macros: testMacros
        )
    }

    func testEnumWrongType() {
        assertMacroExpansion(
            """
            @ReuseIdentifiable
            enum TableViewCell {
            }
            """,
            expandedSource: """

            enum TableViewCell {
            }
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: "@ReuseIdentifier can only be applied to class or struct",
                    line: 1,
                    column: 1
                )
            ],
            macros: testMacros
        )
    }
}
