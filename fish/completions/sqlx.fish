# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_sqlx_global_optspecs
	string join \n h/help
end

function __fish_sqlx_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_sqlx_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_sqlx_using_subcommand
	set -l cmd (__fish_sqlx_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c sqlx -n "__fish_sqlx_needs_command" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_needs_command" -f -a "database" -d 'Group of commands for creating and dropping your database'
complete -c sqlx -n "__fish_sqlx_needs_command" -f -a "prepare" -d 'Generate query metadata to support offline compile-time verification'
complete -c sqlx -n "__fish_sqlx_needs_command" -f -a "migrate" -d 'Group of commands for creating and running migrations'
complete -c sqlx -n "__fish_sqlx_needs_command" -f -a "completions" -d 'Generate shell completions for the specified shell'
complete -c sqlx -n "__fish_sqlx_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -f -a "create" -d 'Creates the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -f -a "reset" -d 'Drops the database specified in your DATABASE_URL, re-creates it, and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and not __fish_seen_subcommand_from create drop reset setup help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from create" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from create" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from create" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -s y -d 'Automatic confirmation. Without this option, you will be prompted before dropping your database'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -s f -l force -d 'PostgreSQL only: force drops the database'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from drop" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -s y -d 'Automatic confirmation. Without this option, you will be prompted before dropping your database'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -s f -l force -d 'PostgreSQL only: force drops the database'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from setup" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from setup" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from setup" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from setup" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from setup" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "create" -d 'Creates the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "reset" -d 'Drops the database specified in your DATABASE_URL, re-creates it, and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand database; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -l check -d 'Run in \'check\' mode. Exits with 0 if the query metadata is up-to-date. Exits with 1 if the query metadata needs updating'
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -l all -d 'Prepare query macros in dependencies that exist outside the current crate or workspace'
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -l workspace -d 'Generate a single workspace-level `.sqlx` folder'
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand prepare" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "add" -d 'Create a new migration with the given description'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "run" -d 'Run all pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "revert" -d 'Revert the latest migration with a down file'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "info" -d 'List all available migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "build-script" -d 'Generate a `build.rs` to trigger recompilation when a new migration is added'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and not __fish_seen_subcommand_from add run revert info build-script help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from add" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from add" -s r -d 'If true, creates a pair of up and down migration files with same version else creates a single sql file'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from add" -s t -l timestamp -d 'If set, use timestamp versioning for the new migration. Conflicts with `--sequential`'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from add" -s s -l sequential -d 'If set, use sequential versioning for the new migration. Conflicts with `--timestamp`'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l target-version -d 'Apply migrations up to the specified version. If unspecified, apply all pending migrations. If already at the target version, then no-op' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l dry-run -d 'List all the migrations to be run without applying'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l ignore-missing -d 'Ignore applied migrations that are missing in the resolved migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l target-version -d 'Revert migrations down to the specified version. If unspecified, revert only the last migration. Set to 0 to revert all migrations. If already at the target version, then no-op' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l dry-run -d 'List the migration to be reverted without applying'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l ignore-missing -d 'Ignore applied migrations that are missing in the resolved migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from revert" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from info" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from info" -s D -l database-url -d 'Location of the DB, by default will be read from the DATABASE_URL env var or `.env` files' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from info" -l connect-timeout -d 'The maximum time, in seconds, to try connecting to the database server before returning an error' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from info" -l no-dotenv -d 'Do not automatically load `.env` files'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from build-script" -l source -d 'Path to folder containing migrations' -r
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from build-script" -l force -d 'Overwrite the build script if it already exists'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from build-script" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "add" -d 'Create a new migration with the given description'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "run" -d 'Run all pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "revert" -d 'Revert the latest migration with a down file'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "info" -d 'List all available migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "build-script" -d 'Generate a `build.rs` to trigger recompilation when a new migration is added'
complete -c sqlx -n "__fish_sqlx_using_subcommand migrate; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand completions" -s h -l help -d 'Print help'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and not __fish_seen_subcommand_from database prepare migrate completions help" -f -a "database" -d 'Group of commands for creating and dropping your database'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and not __fish_seen_subcommand_from database prepare migrate completions help" -f -a "prepare" -d 'Generate query metadata to support offline compile-time verification'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and not __fish_seen_subcommand_from database prepare migrate completions help" -f -a "migrate" -d 'Group of commands for creating and running migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and not __fish_seen_subcommand_from database prepare migrate completions help" -f -a "completions" -d 'Generate shell completions for the specified shell'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and not __fish_seen_subcommand_from database prepare migrate completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "create" -d 'Creates the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "drop" -d 'Drops the database specified in your DATABASE_URL'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "reset" -d 'Drops the database specified in your DATABASE_URL, re-creates it, and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from database" -f -a "setup" -d 'Creates the database specified in your DATABASE_URL and runs any pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from migrate" -f -a "add" -d 'Create a new migration with the given description'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from migrate" -f -a "run" -d 'Run all pending migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from migrate" -f -a "revert" -d 'Revert the latest migration with a down file'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from migrate" -f -a "info" -d 'List all available migrations'
complete -c sqlx -n "__fish_sqlx_using_subcommand help; and __fish_seen_subcommand_from migrate" -f -a "build-script" -d 'Generate a `build.rs` to trigger recompilation when a new migration is added'
