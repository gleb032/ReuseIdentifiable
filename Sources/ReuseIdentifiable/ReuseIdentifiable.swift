/// A macro that generates a `reuseIdentifier` static String field
///
///     @ReuseIdentifier
///     class TableViewCell: UITableViewCell {
///         ...
///     }
///
///     tableView.register(
///         TableViewCell.self,
///         forCellWithReuseIdentifier: TableViewCell.reuseIdentifier
///     )
///
///     let cell = tableView.dequeueReusableCell(
///         withReuseIdentifier: TableViewCell.reuseIdentifier,
///         for: indexPath
///     )
///
@attached(member, names: named(reuseIdentifier))
public macro ReuseIdentifier() = #externalMacro(
    module: "ReuseIdentifiableMacros",
    type: "ReuseIdentifiableMacro"
)
