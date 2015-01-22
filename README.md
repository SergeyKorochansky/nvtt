NVTT
=========

Noosphere Ventures test task

Content
---

- [Simple authentication app](#task-1)
    - [Demo](#demo1)
    - [How to run locally](#how-to-run-locally1)
    - [Tests](#tests1)
- [MySQL database](#task-2)
- [PHP and Ruby quines](#task-3)
    - [Demo](#demo3)
    - [How to run locally](#how-to-run-locally3)
- [JS converter numbers to text](#task-4)
    - [Demo](#demo4)
    - [How to run locally](#how-to-run-locally4)
    - [Tests](#tests4)
- [Copyright](#copyright)


## Task 1

Simple authentication application. Written in [Ruby](https://www.ruby-lang.org/) and [Sinatra](http://www.sinatrarb.com/) framework.

### <a name="demo1"></a>Demo
View [demo](https://nvtt.herokuapp.com/login).

Username: ```john```

Password: ```000```

### <a name="how-to-run-locally1"></a>How to run locally

1. Install ruby and node.js. You can use [RVM](https://rvm.io/) and [NVM](https://github.com/creationix/nvm)
2. Clone this repository:

    ```
    $ git clone https://github.com/webzepter/nvtt
    ```
3. Change directory to task1:

    ```
    $ cd nvtt/task1
    ```
4. Install bundler gem:

    ```
    $ gem install bundler
    ```
5. Install project dependencies:

    ```
    $ bundler install
    ```
6. Run server:

    ```
    $ bundle exec rackup
    ```

Application will be available at [http://localhost:9292](http://localhost:9292)


### Database resetting

If you need to reset database, run:

```
$ bundle exec seed
```

### <a name="tests1"></a>Tests

To run tests you need execute:

```
$ bundle exec test
```

## Task 2


## Task 3

Simple non-empty quines without I/O functions, written in Ruby and PHP

### <a name="demo3"></a>Demo

- Ruby demo: [link](http://ideone.com/J5MY8V).
- PHP demo: [link](http://ideone.com/sNEGQp).

### <a name="how-to-run-locally3"></a>How to run locally:

1. Install ruby and php.
2. Clone this repository

    ```
    $ git clone https://github.com/webzepter/nvtt
    ```
3. Run ruby quine

    ```
    $ ruby task3/quine.rb
    ```
4. Run php quine

    ```
    $ php task3/quine.php
    ```

## Task 4

Small JavaScript library, which provide number to text converter.

Can be used in browser and NodeJS.

Written in CoffeeScript. Source located in task3/source.
Tests are written in CoffeeScript using Mocha.js

### <a name="demo4"></a>Demo

Follow [link](http://jsfiddle.net/webzepter/ggr1qm8e/).

### <a name="how-to-run-locally4"></a>How to run locally:

1. Install node.js. I recommend [NVM](https://github.com/creationix/nvm).
2. Clone this repository

    ```
    $ git clone https://github.com/webzepter/nvtt
    ```
3. Change directory to task3:

    ```
    $ cd nvtt/task3
    ```
5. Install project dependencies:

    ```
    $ npm install
    ```
6. Run build:

    ```
    $ npm run build
    ```
7. Open ```demo.html``` page in browser.

### <a name="tests3"></a>Tests

To run tests you need execute:

```
$ npm test
```

## Copyright

This project is released under the MIT license

Copyright (c) 2015 [Serhij Korochanskyj](https://github.com/webzepter).

See [LICENSE.txt](https://github.com/webzepter/nvtt/blob/master/LICENSE.txt) for further details.
