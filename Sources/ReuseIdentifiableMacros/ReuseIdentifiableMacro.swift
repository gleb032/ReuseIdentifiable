import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

internal enum ReuseIdentifiableError: Error, CustomStringConvertible, CustomDebugStringConvertible {
    case onlyApplicableToClassOrStruct

    var description: String {
        switch self {
        case .onlyApplicableToClassOrStruct:
            "@ReuseIdentifier can only be applied to class or struct"
        }
    }

    var debugDescription: String {
        description
    }
}

public struct ReuseIdentifiableMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            let reuseID = try makeReuseIdentifier(content: structDecl.name.text)
            return [
                DeclSyntax(reuseID)
            ]
        }

        if let classDecl = declaration.as(ClassDeclSyntax.self) {
            let reuseID = try makeReuseIdentifier(content: classDecl.name.text)
            return [
                DeclSyntax(reuseID)
            ]
        }

        throw ReuseIdentifiableError.onlyApplicableToClassOrStruct
    }

    private static func makeReuseIdentifier(content: String) throws -> VariableDeclSyntax {
        try VariableDeclSyntax("static var reuseIdentifier: String") {
            StringLiteralExprSyntax(content: content)
        }
    }
}

@main
struct ReuseIdentifierPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ReuseIdentifiableMacro.self,
    ]
}
