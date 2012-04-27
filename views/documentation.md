# About

Postgres.app is the easiest way to get started with PostgreSQL on the Mac. Open the app, and you have a PostgreSQL server ready and awaiting new connections. Close the app, and the server shuts down.

# How Do I Use It?

Whether you're a command line aficionado, prefer GUIs, or just want to start making things with your framework of choice, connecting to Postgres.app is easy.

## Command-Line Tools

**There is a bug in the latest build that prevents `psql` from connecting, returning the error: `psql: invalid connection option "client_encoding"`. Details of the bug, as well as a workaround [can be found in this issue](https://github.com/mattt/Postgres-for-Mac/issues/7). This will be fixed in the next release.**

`psql` is the PostgreSQL command-line interface to your database. Mac OS 10.7 ships with an older version of PostgreSQL, which can be started with the following command:

```
    $ psql -h localhost
```

### Add Binaries to Your `PATH`

PostgreSQL ships with a constellation of useful binaries, like `pg_dump` or `pg_restore`, that you will likely want to use. Go ahead and add the `/bin` directory that ships with Postgres.app to your `PATH` (preferably in `.profile`, `.bashrc`, `.zshrc`, or the like to make sure this gets set for every Terminal session):

```
    PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
```

Once your path is correctly set up, you should be able to run `psql` without a host. (If not, check that the correct version is being loaded in the `PATH` by doing `which psql`)

## GUI Applications

Explore, query, and visualize your data with [Induction](http://inductionapp.com/). Although still in early development, Induction is fast and easy to use, and is our go-to application when working with data.

If you're looking for something more fully-featured and don't mind getting the kitchen sink in the process, check out [pgAdmin](http://www.pgadmin.org/).

## Configuration Settings

Building a web application and want to skip to the part where everything works? Select the connection settings for your language, framework, and library of choice:

### Ruby

Install the `pg` gem with `gem install pg`, or just add `gem 'pg'` to your application's `Gemfile` and run `bundle install`

If you are running your application with [Foreman](https://github.com/ddollar/foreman), set the `DATABASE_URL` config variable in `.env`:

```
DATABASE_URL=postgres://postgres@localhost/[YOUR_DATABASE_NAME]
```

You can learn more about environment variables from [this Heroku Dev Center article](https://devcenter.heroku.com/articles/config-vars).

#### [Rails](http://rubyonrails.org/)

In `config/database.yml`, use the following settings:

``` yaml
development:
  adapter: postgresql
  database: [YOUR_DATABASE_NAME]
  host: localhost
```

#### [Sinatra](http://www.sinatrarb.com/)

In `config.ru` or your application code:

``` ruby
set :database, ENV['DATABASE_URL'] || 'postgres://localhost/[YOUR_DATABASE_NAME]'
```

#### [ActiveRecord](http://ar.rubyonrails.org/)

Install the `activerecord` gem and `require 'active_record'`, and establish a database connection:

``` ruby
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
```

#### [DataMapper](http://datamapper.org/)

Install and require the `datamapper` and `do_postgres` gems, and create a database connection:

``` ruby
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/[YOUR_DATABASE_NAME]")
```

#### [Sequel](http://sequel.rubyforge.org/)

Install and require the `sequel` gem, and create a database connection:

``` ruby
DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/[YOUR_DATABASE_NAME]")
```

# I Already Have PostgreSQL Installed. How Do I Uninstall It?

For best results, you should remove any existing installation of PostgreSQL. Here's a run-down of the most common ways you may have installed it previously:

## Homebrew

TODO

## MacPorts

TODO

## EnterpriseDB

TODO

## Compiled From Source

TODO

### PHP

#### [PDO](http://www.php.net/manual/en/book.pdo.php)

Make sure your PHP setup has PDO installed (it is enabled by default in PHP 5.1.0 or above), and the [PostgreSQL PDO driver](http://www.php.net/manual/en/ref.pdo-pgsql.php) is enabled. Then a database connection can be established with:

``` php
<?php
$dbh = new PDO('pgsql:host=localhost;dbname=[YOUR_DATABASE_NAME]');
```

If other PHP database toolkits ask for a DSN string, it is as simple as

```
pgsql:host=localhost;dbname=[YOUR_DATABASE_NAME]
```

# What's Installed?

Each release of Postgres.app comes with the latest stable release of PostgreSQL, as well as several of the most popular extensions. Here's a rundown of what's under the hood:

- [PostgreSQL 9.1.3](http://www.postgresql.org/)
- [PostGIS 2.0.0](http://postgis.refractions.net/)
- [GDAL 1.9.0](http://www.gdal.org/)
- [GEOS 3.3.2](http://trac.osgeo.org/geos/)
- [PROJ.4 4.7.0](http://trac.osgeo.org/proj/)

# Where Is Everything Installed?

- Binaries: `/Applications/Postgres.app/Contents/MacOS/bin`
- Headers: `/Applications/Postgres.app/Contents/MacOS/include`
- Libraries: `/Applications/Postgres.app/Contents/MacOS/lib`
- Shared Libraries: `/Applications/Postgres.app/Contents/MacOS/share`
- Data: `~/Library/Containers/com.heroku.Postgres/Data/Library/Application\ Support/Postgres/var`

# How To Uninstall

Uninstall Postgres.app just like you would any application: quit, drag to the Trash, and Empty Trash.

The application container resides at `~/Library/Containers/com.heroku.Postgres`, so remove that when uninstalling, or if you need to do a hard reset on the database.

# Additional Resources

- [PostgreSQL Website](http://www.postgresql.org/) - The source for all of the latest PostgreSQL news and information.
- [PostgreSQL Docs](http://www.postgresql.org/docs/9.1/interactive/index.html) - The canonical reference for everything you need to know about PostgreSQL.
- [Postgres Guide](http://postgresguide.com/) - A promising new PostgreSQL resource that reads well and introduces advanced topics in a way that's easy to understand.
- [Heroku Postgres](https://postgres.heroku.com/) - The largest and most reliable Postgres service in the world, for when it comes time to deploy and scale your database in production.
