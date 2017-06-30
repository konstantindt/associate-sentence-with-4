# Associate Sentence with 4 (prototype)

## Design

This project can be used to associate four possible sentences with one sentence. The process can be repeated for each new sentence. Navigation options; forward or back to start. No persistence layer required.

## Technology

Project created with [Ruby][1] and [sinatra][2].

[1]: https://www.ruby-lang.org/
[2]: http://www.sinatrarb.com/

## Usage

For [Deploy](#Deploy) make sure your working directory is:
```bash
$ cd path/to/project/directory/associate-sentence-with-4
```

### Gem Requirements

To make the set-up smooth please install the [bundler][3] Ruby gem if you have not done so already.
```bash
$ gem install bundler
```

[3]: http://bundler.io/

### Deploy

Firstly we can install dependencies as follows
```bash
$ bundle install
```
before running the app with
```bash
$ ruby app.rb
```
Finally to use the web app open
http://localhost:4567
with your web browser (tested with ```Chromium 57.0.2987.98```).

## Approach

This prototype was put together as fast as circumstances allowed so that feedback can be gathered as soon possible---since this is the first implementation in the history of this project---because it is important to verify that the correct design concept was used; if not little precious time was wasted before attempting to use the correct concept.

### Implementation

Initially it was attempted to store the next 'sentences' in a separate fields within the class; the intention was to nest the instances. Shortly after that it became apparent that since the client has restrictive UI---once a sentence is set it cannot be changed and we can set only up to four sentences---a simpler strategy of storing one field that is an array of four sentences was chosen.

After struggling with the 'nested instances' idea it was abandoned---it was just taking too long to debug---for a map data structure. Each sentence created is a key in the map that returns the four possible associated sentences (undefined sentences can be identified). With the map data structure already implemented in Ruby's standard library the data part of the app was created after storing the map data structure and the first sentence in the data template so that we can access them at any stage during app execution.

The project includes an extra home page; that page was created while I was getting familiar with the [sinatra][2] technology so it was easier to integrate it into the project rather than stopping the user from creating the initial sentence i.e. the app was built on top of it.

To make it a smoother experience to take this code base further relatively a lot of effort went on trying to not repeat code in the HTML. I felt this is important for implementation clarity and saving time in the long run---especially as this level of being DRY with HTML was not attempted before and this skill is useful in pretty much all web implementation projects.

#### Extensions?

* Add option to select root sentences or create new ones.

#### Conclusion

Despite [sinatra][2]'s simplicity it was difficult to marry the view (client) with the controller (server) due to the current lack of web development experience and the correctness of that result still needs to be evaluated; correctness is extremely beneficial if it is required to maintain and deploy the app for real. That said it is believed that the design initially understood from the client was achieved by this implementation.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
