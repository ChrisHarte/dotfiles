## The Joel Test: 12 Steps to Better Code - Joel on Software

Wanted: Software Developer at Two Sigma Investments LLC (New York, NY). See this and other great job listings on the jobs page.
Joel on Software
The Joel Test: 12 Steps to Better Code

by Joel Spolsky
Wednesday, August 09, 2000
Have you ever heard of SEMA? It's a fairly esoteric system for measuring how good a software team is. No, wait! Don't follow that link! It will take you about six years just to understand that stuff. So I've come up with my own, highly irresponsible, sloppy test to rate the quality of a software team. The great part about it is that it takes about 3 minutes. With all the time you save, you can go to medical school.


  
The Joel Test

Do you use source control?
Can you make a build in one step?
Do you make daily builds?
Do you have a bug database?
Do you fix bugs before writing new code?
Do you have an up-to-date schedule?
Do you have a spec?
Do programmers have quiet working conditions?
Do you use the best tools money can buy?
Do you have testers?
Do new candidates write code during their interview?
Do you do hallway usability testing?


The neat thing about The Joel Test is that it's easy to get a quick yes or no to each question. You don't have to figure out lines-of-code-per-day or average-bugs-per-inflection-point. Give your team 1 point for each "yes" answer. The bummer about The Joel Test is that you really shouldn't use it to make sure that your nuclear power plant software is safe.

A score of 12 is perfect, 11 is tolerable, but 10 or lower and you've got serious problems. The truth is that most software organizations are running with a score of 2 or 3, and they need serious help, because companies like Microsoft run at 12 full-time. 

Of course, these are not the only factors that determine success or failure: in particular, if you have a great software team working on a product that nobody wants, well, people aren't going to want it. And it's possible to imagine a team of "gunslingers" that doesn't do any of this stuff that still manages to produce incredible software that changes the world. But, all else being equal, if you get these 12 things right, you'll have a disciplined team that can consistently deliver.

1. Do you use source control?
I've used commercial source control packages, and I've used CVS, which is free, and let me tell you, CVS is fine. But if you don't have source control, you're going to stress out trying to get programmers to work together. Programmers have no way to know what other people did. Mistakes can't be rolled back easily. The other neat thing about source control systems is that the source code itself is checked out on every programmer's hard drive -- I've never heard of a project using source control that lost a lot of code.

2. Can you make a build in one step?
By this I mean: how many steps does it take to make a shipping build from the latest source snapshot? On good teams, there's a single script you can run that does a full checkout from scratch, rebuilds every line of code, makes the EXEs, in all their various versions, languages, and #ifdef combinations, creates the installation package, and creates the final media -- CDROM layout, download website, whatever.

If the process takes any more than one step, it is prone to errors. And when you get closer to shipping, you want to have a very fast cycle of fixing the "last" bug, making the final EXEs, etc. If it takes 20 steps to compile the code, run the installation builder, etc., you're going to go crazy and you're going to make silly mistakes.

For this very reason, the last company I worked at switched from WISE to InstallShield: we required that the installation process be able to run, from a script, automatically, overnight, using the NT scheduler, and WISE couldn't run from the scheduler overnight, so we threw it out. (The kind folks at WISE assure me that their latest version does support nightly builds.)

3. Do you make daily builds?
When you're using source control, sometimes one programmer accidentally checks in something that breaks the build. For example, they've added a new source file, and everything compiles fine on their machine, but they forgot to add the source file to the code repository. So they lock their machine and go home, oblivious and happy. But nobody else can work, so they have to go home too, unhappy.

Breaking the build is so bad (and so common) that it helps to make daily builds, to insure that no breakage goes unnoticed. On large teams, one good way to insure that breakages are fixed right away is to do the daily build every afternoon at, say, lunchtime. Everyone does as many checkins as possible before lunch. When they come back, the build is done. If it worked, great! Everybody checks out the latest version of the source and goes on working. If the build failed, you fix it, but everybody can keep on working with the pre-build, unbroken version of the source.

On the Excel team we had a rule that whoever broke the build, as their "punishment", was responsible for babysitting the builds until someone else broke it. This was a good incentive not to break the build, and a good way to rotate everyone through the build process so that everyone learned how it worked. 

Read more about daily builds in my article Daily Builds are Your Friend.

4. Do you have a bug database?
I don't care what you say. If you are developing code, even on a team of one, without an organized database listing all known bugs in the code, you are going to ship low quality code. Lots of programmers think they can hold the bug list in their heads. Nonsense. I can't remember more than two or three bugs at a time, and the next morning, or in the rush of shipping, they are forgotten. You absolutely have to keep track of bugs formally.

Bug databases can be complicated or simple. A minimal useful bug database must include the following data for every bug:

complete steps to reproduce the bug
expected behavior
observed (buggy) behavior
who it's assigned to
whether it has been fixed or not
If the complexity of bug tracking software is the only thing stopping you from tracking your bugs, just make a simple 5 column table with these crucial fields and start using it.

For more on bug tracking, read Painless Bug Tracking.

5. Do you fix bugs before writing new code?
The very first version of Microsoft Word for Windows was considered a "death march" project. It took forever. It kept slipping. The whole team was working ridiculous hours, the project was delayed again, and again, and again, and the stress was incredible. When the dang thing finally shipped, years late, Microsoft sent the whole team off to Cancun for a vacation, then sat down for some serious soul-searching.

What they realized was that the project managers had been so insistent on keeping to the "schedule" that programmers simply rushed through the coding process, writing extremely bad code, because the bug fixing phase was not a part of the formal schedule. There was no attempt to keep the bug-count down. Quite the opposite. The story goes that one programmer, who had to write the code to calculate the height of a line of text, simply wrote "return 12;" and waited for the bug report to come in about how his function is not always correct. The schedule was merely a checklist of features waiting to be turned into bugs. In the post-mortem, this was referred to as "infinite defects methodology".

To correct the problem, Microsoft universally adopted something called a "zero defects methodology". Many of the programmers in the company giggled, since it sounded like management thought they could reduce the bug count by executive fiat. Actually, "zero defects" meant that at any given time, the highest priority is to eliminate bugs before writing any new code. Here's why. 

In general, the longer you wait before fixing a bug, the costlier (in time and money) it is to fix.

For example, when you make a typo or syntax error that the compiler catches, fixing it is basically trivial.

When you have a bug in your code that you see the first time you try to run it, you will be able to fix it in no time at all, because all the code is still fresh in your mind.

If you find a bug in some code that you wrote a few days ago, it will take you a while to hunt it down, but when you reread the code you wrote, you'll remember everything and you'll be able to fix the bug in a reasonable amount of time.

But if you find a bug in code that you wrote a few months ago, you'll probably have forgotten a lot of things about that code, and it's much harder to fix. By that time you may be fixing somebody else's code, and they may be in Aruba on vacation, in which case, fixing the bug is like science: you have to be slow, methodical, and meticulous, and you can't be sure how long it will take to discover the cure.

And if you find a bug in code that has already shipped, you're going to incur incredible expense getting it fixed.

That's one reason to fix bugs right away: because it takes less time. There's another reason, which relates to the fact that it's easier to predict how long it will take to write new code than to fix an existing bug. For example, if I asked you to predict how long it would take to write the code to sort a list, you could give me a pretty good estimate. But if I asked you how to predict how long it would take to fix that bug where your code doesn't work if Internet Explorer 5.5 is installed, you can't even guess, because you don't know (by definition) what's causing the bug. It could take 3 days to track it down, or it could take 2 minutes.

What this means is that if you have a schedule with a lot of bugs remaining to be fixed, the schedule is unreliable. But if you've fixed all the known bugs, and all that's left is new code, then your schedule will be stunningly more accurate.

Another great thing about keeping the bug count at zero is that you can respond much faster to competition. Some programmers think of this as keeping the product ready to ship at all times. Then if your competitor introduces a killer new feature that is stealing your customers, you can implement just that feature and ship on the spot, without having to fix a large number of accumulated bugs.

6. Do you have an up-to-date schedule?
Which brings us to schedules. If your code is at all important to the business, there are lots of reasons why it's important to the business to know when the code is going to be done. Programmers are notoriously crabby about making schedules. "It will be done when it's done!" they scream at the business people.

Unfortunately, that just doesn't cut it. There are too many planning decisions that the business needs to make well in advance of shipping the code: demos, trade shows, advertising, etc. And the only way to do this is to have a schedule, and to keep it up to date.

The other crucial thing about having a schedule is that it forces you to decide what features you are going to do, and then it forces you to pick the least important features and cut them rather than slipping into featuritis (a.k.a. scope creep).

Keeping schedules does not have to be hard. Read my article Painless Software Schedules, which describes a simple way to make great schedules.

7. Do you have a spec?
Writing specs is like flossing: everybody agrees that it's a good thing, but nobody does it. 

I'm not sure why this is, but it's probably because most programmers hate writing documents. As a result, when teams consisting solely of programmers attack a problem, they prefer to express their solution in code, rather than in documents. They would much rather dive in and write code than produce a spec first.

At the design stage, when you discover problems, you can fix them easily by editing a few lines of text. Once the code is written, the cost of fixing problems is dramatically higher, both emotionally (people hate to throw away code) and in terms of time, so there's resistance to actually fixing the problems. Software that wasn't built from a spec usually winds up badly designed and the schedule gets out of control.  This seems to have been the problem at Netscape, where the first four versions grew into such a mess that management stupidly decided to throw out the code and start over. And then they made this mistake all over again with Mozilla, creating a monster that spun out of control and took several years to get to alpha stage.

My pet theory is that this problem can be fixed by teaching programmers to be less reluctant writers by sending them off to take an intensive course in writing. Another solution is to hire smart program managers who produce the written spec. In either case, you should enforce the simple rule "no code without spec".

Learn all about writing specs by reading my 4-part series.

8. Do programmers have quiet working conditions?
There are extensively documented productivity gains provided by giving knowledge workers space, quiet, and privacy. The classic software management book Peopleware documents these productivity benefits extensively.

Here's the trouble. We all know that knowledge workers work best by getting into "flow", also known as being "in the zone", where they are fully concentrated on their work and fully tuned out of their environment. They lose track of time and produce great stuff through absolute concentration. This is when they get all of their productive work done. Writers, programmers, scientists, and even basketball players will tell you about being in the zone.

The trouble is, getting into "the zone" is not easy. When you try to measure it, it looks like it takes an average of 15 minutes to start working at maximum productivity. Sometimes, if you're tired or have already done a lot of creative work that day, you just can't get into the zone and you spend the rest of your work day fiddling around, reading the web, playing Tetris.

The other trouble is that it's so easy to get knocked out of the zone. Noise, phone calls, going out for lunch, having to drive 5 minutes to Starbucks for coffee, and interruptions by coworkers -- especially interruptions by coworkers -- all knock you out of the zone. If a coworker asks you a question, causing a 1 minute interruption, but this knocks you out of the zone badly enough that it takes you half an hour to get productive again, your overall productivity is in serious trouble. If you're in a noisy bullpen environment like the type that caffeinated dotcoms love to create, with marketing guys screaming on the phone next to programmers, your productivity will plunge as knowledge workers get interrupted time after time and never get into the zone.

With programmers, it's especially hard. Productivity depends on being able to juggle a lot of little details in short term memory all at once. Any kind of interruption can cause these details to come crashing down. When you resume work, you can't remember any of the details (like local variable names you were using, or where you were up to in implementing that search algorithm) and you have to keep looking these things up, which slows you down a lot until you get back up to speed.

Here's the simple algebra. Let's say (as the evidence seems to suggest) that if we interrupt a programmer, even for a minute, we're really blowing away 15 minutes of productivity. For this example, lets put two programmers, Jeff and Mutt, in open cubicles next to each other in a standard Dilbert veal-fattening farm. Mutt can't remember the name of the Unicode version of the strcpy function. He could look it up, which takes 30 seconds, or he could ask Jeff, which takes 15 seconds. Since he's sitting right next to Jeff, he asks Jeff. Jeff gets distracted and loses 15 minutes of productivity (to save Mutt 15 seconds).

Now let's move them into separate offices with walls and doors. Now when Mutt can't remember the name of that function, he could look it up, which still takes 30 seconds, or he could ask Jeff, which now takes 45 seconds and involves standing up (not an easy task given the average physical fitness of programmers!). So he looks it up. So now Mutt loses 30 seconds of productivity, but we save 15 minutes for Jeff. Ahhh!

9. Do you use the best tools money can buy?
Writing code in a compiled language is one of the last things that still can't be done instantly on a garden variety home computer. If your compilation process takes more than a few seconds, getting the latest and greatest computer is going to save you time. If compiling takes even 15 seconds, programmers will get bored while the compiler runs and switch over to reading The Onion, which will suck them in and kill hours of productivity.

Debugging GUI code with a single monitor system is painful if not impossible. If you're writing GUI code, two monitors will make things much easier.

Most programmers eventually have to manipulate bitmaps for icons or toolbars, and most programmers don't have a good bitmap editor available. Trying to use Microsoft Paint to manipulate bitmaps is a joke, but that's what most programmers have to do.

At my last job, the system administrator kept sending me automated spam complaining that I was using more than ... get this ... 220 megabytes of hard drive space on the server. I pointed out that given the price of hard drives these days, the cost of this space was significantly less than the cost of the toilet paper I used. Spending even 10 minutes cleaning up my directory would be a fabulous waste of productivity.

Top notch development teams don't torture their programmers. Even minor frustrations caused by using underpowered tools add up, making programmers grumpy and unhappy. And a grumpy programmer is an unproductive programmer.

To add to all this... programmers are easily bribed by giving them the coolest, latest stuff. This is a far cheaper way to get them to work for you than actually paying competitive salaries!

10. Do you have testers?
If your team doesn't have dedicated testers, at least one for every two or three programmers, you are either shipping buggy products, or you're wasting money by having $100/hour programmers do work that can be done by $30/hour testers. Skimping on testers is such an outrageous false economy that I'm simply blown away that more people don't recognize it.

Read Top Five (Wrong) Reasons You Don't Have Testers, an article I wrote about this subject.

11. Do new candidates write code during their interview?
Would you hire a magician without asking them to show you some magic tricks? Of course not.

Would you hire a caterer for your wedding without tasting their food? I doubt it. (Unless it's Aunt Marge, and she would hate you forever if you didn't let her make her "famous" chopped liver cake).

Yet, every day, programmers are hired on the basis of an impressive resumé or because the interviewer enjoyed chatting with them. Or they are asked trivia questions ("what's the difference between CreateDialog() and DialogBox()?") which could be answered by looking at the documentation. You don't care if they have memorized thousands of trivia about programming, you care if they are able to produce code. Or, even worse, they are asked "AHA!" questions: the kind of questions that seem easy when you know the answer, but if you don't know the answer, they are impossible.

Please, just stop doing this. Do whatever you want during interviews, but make the candidate write some code. (For more advice, read my Guerrilla Guide to Interviewing.)

12. Do you do hallway usability testing?
A hallway usability test is where you grab the next person that passes by in the hallway and force them to try to use the code you just wrote. If you do this to five people, you will learn 95% of what there is to learn about usability problems in your code.

Good user interface design is not as hard as you would think, and it's crucial if you want customers to love and buy your product. You can read my free online book on UI design, a short primer for programmers.

But the most important thing about user interfaces is that if you show your program to a handful of people, (in fact, five or six is enough) you will quickly discover the biggest problems people are having. Read Jakob Nielsen's article explaining why. Even if your UI design skills are lacking, as long as you force yourself to do hallway usability tests, which cost nothing, your UI will be much, much better.

Four Ways To Use The Joel Test

Rate your own software organization, and tell me how it rates, so I can gossip.
If you're the manager of a programming team, use this as a checklist to make sure your team is working as well as possible. When you start rating a 12, you can leave your programmers alone and focus full time on keeping the business people from bothering them.
If you're trying to decide whether to take a programming job, ask your prospective employer how they rate on this test. If it's too low, make sure that you'll have the authority to fix these things. Otherwise you're going to be frustrated and unproductive.
If you're an investor doing due diligence to judge the value of a programming team, or if your software company is considering merging with another, this test can provide a quick rule of thumb.

Hoorah! FogBugz 7 just shipped, and it’s a huge new release. See what's new and try the online demo today!
Next:
Wasting Money on Cats



Want to know more?
You’re reading Joel on Software, stuffed with years and years of completely raving mad articles about software development, managing software teams, designing user interfaces, running successful software companies, and rubber duckies.



About the author.
I’m Joel Spolsky, founder of Fog Creek Software, a New York company that proves that you can treat programmers well and still be highly profitable. Programmers get private offices, free lunch, and work 40 hours a week. Customers only pay for software if they’re delighted. We make FogBugz, an enlightened project management system designed to help great teams develop brilliant software, and Fog Creek Copilot, which makes remote desktop access easy.

© 2000-2009 Joel Spolsky

## Shotgun Rules

SHOTGUN RULES FOR BAD MEETINGS

RULE 1: Each month, the BAD meeting will be on the 2nd Wednesday of
     the month

RULE 2: Determination for the location for the BAD meeting
     is like calling shotgun for the front passenger seat of a
     car. Whoever calls the location first, wins, and that's where BAD is
     going to be, period. In case of close calls, "first" is determined by
     date received by the list server machine, and ties go to the runner.

RULE 3: A meeting announcement must be posted by email to the
     BAD list, with the word "ANNOUNCEMENT" in the Subject header. It
     must define a time, a location (with address and/or directions
     by car and public transportation), and use the declarative voice
     ("We are going to..." not "Would you guys like to go to...?"). It
     should not be sent before the previous month's meeting has happened
     (or should have happened).

RULE 4: If you make the announcement, you have to go, you have to be
     on time and preferably early, and you have to make a little sign
     that says "BAD" so people know where they're supposed to sit.

RULE 5: If no one makes an announcement, the meeting will not
     happen. If nobody cares enough to take responsibility and make an
     announcement, and everyone minces around with do-you-think's and
     what-about-this's, we are weak and cowardly and do not deserve a
     lovely meeting together.
 
RULE 6: Nobody is making you go to BAD meetings. Your
     dialysis machine is not at the BAD meeting. You are not a robot of
     the future who will be stuck in our dimension forever if you don't
     attend the BAD meeting.

     If, for some reason, you cannot make it to the BAD meeting, or you
     don't like where it's being held, or Chinese food gives you an upset
     tummy, then Don't Go, and make a note in your calendar to yourself
     to take some initiative and make the next month's announcement.

RULE 7: In case of SEVERE HAZARD -- for example, the originally chosen
     venue has burnt to the ground or is on fire at the scheduled time
     for the meeting, etc. -- the original organizer should post a new
     announcement according to rule 3, mentioning prominently that it
     is a change.

     The organizer MUST put a sign and/or a human runner at the original
     venue to send people who missed the revised announcement to the
     new location.

That's it. 7 simple rules. The Date Rule, the Shotgun Rule, the Email
Rule, the Organizer Rule, the Have a Spine Rule, the Take Your
Lumps Rule, and the System Crash Rule.

Now, as another reminder, here's the non-binding part. 

* Good locations for a BAD meeting will have:

     * Food
     * Cheap food
     * Good food
     * Alcoholic beverages
     * Non-alcoholic beverages
     * Access for minors and people under 21
     * Separate checks
     * Seats for 10-30 people
     * Room to push tables together, or pull them apart
     * Forgiveness for people coming and leaving at will
     * Something for vegetarians to eat
     * Something for carnivores to eat
     * Enough quiet that we can talk
     * Enough loudness that we're not a big distraction
     * Enough light that we can see the network diagrams we're drawing
       on the backs of napkins
     * Access by public transportation
     * Access by car
     * Nearby parking
     * Easy directions

  Obviously, there's no requirement that every location have all these
  things, and most locations won't. And you are the sole determiner of
  where everyone goes: you can call the meeting for a XXX movie
  theater or your own home or a cardboard box under the freeway. But
  it'd be nice to meet these goals.

* Restaurants and cafes that have been historically supportive of our
  cause deserve our business and dollars.

* A good time for meeting is A) late enough that people can get off
  work and drive or ride from their region to the region the meeting
  is in, and B) not so late that the place is going to close, or
  people have to go home for sleep. Think 7-8PM.

* If you think you know a good place to go, announce it. If you don't,
  shut up. When people post do-you-think's and what-about-this's, it
  clouds the waters and everyone gets confused. So don't do that.

* If for some reason you are far outside the preferred region of the
  meeting, you should think about starting an offshoot group and
  having separate meetings.

* A good meeting attendee will bring money for their share of food and
  drink if they can. If they can't, they will keep their grubby mitts
  off the food and drink. If they share from common food or drink
  (such as pizzas or fries or pitchers of beer), they will get up and
  get another pizza or basket of fries or pitcher or whatever when the
  current one runs out.  They will chip in for what they ate, and pay
  for what they ordered, and remember the tip, and round up rather
  than down.

* A sample announcement email would look like this:

  ---8<---
  From: Evan Prodromou <evan@debian.org>
  To: bad@bad.debian.net
  Subject: ANNOUNCEMENT: B.A.D. Meeting For April 2002
  Date: 24 Mar 2002 08:31:11 -0800

  The B.A.D. meeting for this month will be held at Munster's Pizza
  Parlor on April 10th, 2002 at 1313 Mockingbird Lane in Berkeley at
  7:30PM.

  Munster's is at the corner of Mockingbird and Yourtown Street on the
  Number 17 AC Transit line. It is a 2 block walk from the Northside
  BART station.

  I will be organizing a PGP key-signing. If you want to participate,
  please send me your OpenPGP public key by noon on April 10th.

  See you there,

  ~ESP
  ---8<---

  Note that this message projects authority, it has all important
  information, and it does not use a question mark anywhere in the
  message or subject line.

* There is no shame in announcing the meeting for someplace that
  BAD has already been before. Heck: if it was good enough
  before, it's probably good enough now.

* If you make an announcement, it's entirely possible that NO ONE will
  come. This is the risk you run. You have put yourself on the line,
  and it's within the realm of likelihood that you will spend the
  night lonely and afraid, standing naked in the rain while fire ants
  crawl on your legs and chomp your skin and all of the people you
  have ever had secret crushes on point at you and laugh and laugh.

  In short, it will be the worst night of your entire life, bar
  none. If you are prepared for this, any other outcome will be icing
  on the cake.

  If you are not prepared for this, and you send a vituperative and
  bitter email to the BAD list on the Day After, you will
  come off like a fool, and you will have capped your disastrous event
  with a bitter and ugly conclusion. This is not smart, so don't do
  that.

---------------------------------------------------------------------------

Copyright (c)  2002  Evan Prodromou.

Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.1 or
any later version published by the Free Software Foundation; with no
Invariant Sections, with no Front-Cover Texts, and with the Back-Cover
Texts being this copyright notice. A copy of the license is available
at http://www.gnu.org/licenses/fdl.txt.


## Programming Terms

OOP  class         :defines the abstract characteristics of a thing,       attributes, behaviours      blueprint to the nature of something      provide modularity & structure in oop      self-contained
  object    :pattern/exemplar of a dog      defines all possible dogs      characteristics and behaviours of them
  instance    :an instance of a class or object      object created at runtime      consists of a state and the behaviours it inherits derived from the object
  method    :an objects abilities      e.g. functions      bark()        message-passing    :process in which one object passes data to another object      Lassie sit      some languages do double-dispatch or multi-dispatch        inheritance    :more specialised versions of a class      inherit attributes and methods from their parent class      building upon them for specific needs    :multiple-inheritance is inheritance from more than one ancestor class      abstraction    :simplifying complex realities by modelling classes appropriate to the problem      you don't need to know how they work, simply how to properly interface them
  encapsulation    :conceals the functional details of a class from objects that message it      reason for this is to prevent clients relying on components inside the       class which may change in the future.  they can use the bark() method without      fear of it changing (and you can change use it as a placeholder changing the       logic without fear of incurring changes on your clients).    :methods are often specified as public/private/protected exactly for this case.        polymorphism    :allows you to treat derived class members just like their parent classes    :e.g. objects belonging to different data-types can respond to methods calls      in their own specific way, so Dog:speak() goes one way, Cat:speak() goes another      even though they both inherit their methods from the Animal class           decoupling    :allows for separation of object interactions from classes & inheritance to        distinct layes of abstraction.    :e.g. to polymorphically decouple the encapsulation into common reusable parts        OOP in Scripting  :PHP-5, Ruby, Perl, JavaScript, ActionScript
Design Pattern  :generally reusable solution to a commonly occuring problem in software design  :it's a description of a template that can be used in many different scenarios    * creational      .abstract  :provides an interface for creating families or related objects      .factory   :define an interface for creating objects but lets you defer creation to it subclasses      .singleton :only one instance and provide a global point of access to it    * structural      .adapter      .bridge      .composite      .decorator      .facade     * behavioral      .iterator      .observer      .strategy      .template method
REST  :representational state transfer    * resources (referenced by a global identifier)    * CRUD      :post   - create      :get    - read      :put    - update / create      :delete - delete    * /collection/cars    (list/create)      /collection/cars/id (show specific record, read/update/delete)
Test-driven Development  :RSpec    * provides a Domain Specific Language (DSL) with which you can express       executable examples of the expected behaviour of your code.
        describe Account, " when first created" do          it "should have a balance of $0" do            ...          end        end        :ZenTest    # Test and implementation methods generated automatically.       Focus on content, not structure.    # Know where to work next.    # Get quick feedback on progress.    # Runs tests continuously, improved feedback, based on files you've changed    # Audits your tests to ensure you have full coverage    
  :General    * Cycle      - add a test      - run all tests to see if any fail      - write some code      - run automated tests and see them succeed      - refactor code      - repeat    * write the tests first (should be written before the functionality, so the       developers think about writing for the tests from the outset rather than      an afterthought later)    * fail the tests (to make sure they really will catch an error) 
Client-side A-B testing  do one process in two ways to determine which is better
AJAX  :Prototype (moveme.com, wspgroup.com, dateswithmates.com, packpay.com)  :jQuery (moveme.com, red91.com, keepthinking)  :MooTools (moveme.com)  :DoJo (moveme.com)
LAMP  :MySQL 5 (InnoDB, MyISAM)  :PHP 5  :Ruby 1.8.7  :Rails 2.3    * templates (scripts)    * engines (reusable components to common things)    * gems  :administration    * NGINX    * Apache    * Passenger  :deployment    * github, svn, cvs, mercurial    * rsync    * capistrano    * ssh keys      :security    * ssh    * iptables        * Agile background, unit testing, version control (git, svn, sourcesafe and mercurial)
Browser Testing  :Google Chrome  :Firefox  :Safari  :Opera  :IE 6, 7, 8  :Selenium (core)
Ruby 1.9 features  :YARV, replaces Matz interpreter MRI for performance  :Fibers, little processes that can be run paused and resumed at any time, very little RAM  :Named Regexp groups, allowing you to create snippets  :Lambda operator,   :RubyGems and RAKE now merged into Ruby   
Agile  :continuous testing  :pair programming  :test driven development  :design patterns  :domain-driven designs  :code refactoring  Scrum  :Daily Scrum    * 15 minutes    * what done yesterday    * planning to do today    * any impediments  :Sprint Planning Meeting    * select work to be done    * prepare sprint backlog   :Sprint Review Meeting    * review work completed and not completed    * present completed work to stakeholders    * incomplete work cannot be demonstrated  :Sprint Retrospective    * reflect on sprint    * make continuous process improvement    * what went well?, what could be improved?  :Product Backlog    * all tasks needed for product  :Sprint Backlog    * tasks assigned for this particular sprint  :Burn-Down    * publicly displayed chart showing work progress in sprint
Agile - Definition of Done      # Code produced (all 'to do' items in code completed)  # Code commented, checked in and run against current version in source control  # Peer reviewed (or produced with pair programming) and meeting development standards  # Builds without errors  # Unit tests written and passing  # Deployed to system test environment and passed system tests  # Passed UAT (User Acceptance Testing) and signed off as meeting requirements  # Any build/deployment/configuration changes implemented/documented/communicated  # Relevant documentation/diagrams produced and/or updated  # Remaining hours for task set to zero and task closed  Agile Manifesto  * Individuals and interactions ..over processes and tools  * Working software ..over comprehensive documentation  * Customer collaboration ..over contract negotiation  * Responding to change ..over following a plan    
Ruby Loves:    1) Blocks. The syntax makes them trivial and the stdlib uses them everywhere. You don't realize how much explicitly writing loops sucks until you stop having to do it. (And the syntax naturally extends itself to things like resource management, e.g. File.open).    2) OO model. Everything is receiver.method_call. It's sooo consistent.
  3) Meta-programming. Tacking new methods on to existing classes. Using attr_accessor and friends. Writing your own versions of them. See Rake and Rails for how easy this for making domain-specific languages.

  lambda {|e| puts(e)}  l.collect {|e| ...}


Web Analytics  * hit - request for a file from the web server  * page view - request for a file which is defined as a page in log analysis  * visit/session - series of requests determined as a users time at one point  * bounce rate - percentage of visitors who enter one page and exit the same without any other action  * click path - sequence of urls user follows on your site  * request - file request (get)

## Being 37Signals for free

Jason Fried says:

April 16th, 2006 at 12:08 pm
Thanks for the press, Scrivs and Co.

A few things…

1. You severely underestimate the time, vision, and leadership it takes to bring *any* product to market — especially a consumer/business product used by non-techies. Basecamp, Blinksale, Typepad, Flickr, etc — they are all “simple” tools on the surface. It’s what you don’t see that’s the hard part. It’s not a matter of getting some talented people in the room. That’s the easy part. Making the right decisions at the right time for the right reasons is the hard part. The decisions involve design, development, marketing, promotion, support, analyzing customer feedback, what to add in or leave out, etc.

2. There are already hundreds of project management apps out there. Do a search for “Project Management Software” on Google. So you’re “tool-in-a-weekend” idea isn’t just going to compete with Basecamp, but it will also compete with the hundreds of others tools already established in the market. Basecamp didn’t create the space, it entered the already well established space. We had a different take on project management/collaboration, we didn’t just copy another player. If you have a better idea go for it, but there’s little gained by copying someone else.

3. Talented people are busy. They aren’t sitting around waiting to copy the next big thing. And talented people also prefer to work on something meaningful, not copying someone else’s hard work so they can save $12/month. That isn’t satisfying work and when you aren’t satisfied at your core then the product will reflect that.

4. Where’s the motivation? Why spend months and months copying something that is pretty good already? People are motivated to spend their time making something considerably better than what’s out there, not making something that’s on par with something out there. There are plenty of great new ideas to be developed — why not spend your brainpower and energy on those?

5. There are very few successful ad-supported software products. Are there *any* from anyone besides the huge companies that can afford to subsidize new products with revenue from other endevours? Ad-supported content is different from ad-supported software. It’s not as easy as saying “If you want to do a hosted model you could still sell advertising and run things for free.”

5. It’s already been 11 days since you posted this. That’s two weekends and a handful of days. Any progress?

## Interview Pointers

don't blindly follow the advice of others, make your own judgements

tell stories
be positive
be a problem solver
be honest

your hired to solve problems by yourself, not ask how to do them

look at things you've built before and how you put them together, what problems did you overcome and why did you do them that way?

  i come in, speak to to others, try to gain a rapport with them and understand their likes dislikes, what drives them so i can work better with them and we can share ideas, knock things around and grow stronger together.

  if i know anything that'd help them or have a book at home they'd like to borrow, it's theirs, i like to make friends and work with good people

  if i see someone with a problem, or see something i can help with i jump in; there's usually more than one way to do something, plus if i put a smile on someone's face it's worth it.

don't complain

motivation
  self-actualization
  cognitive
  ego/esteem
  social
  safety
  physiological
 
what was wrong with moveme?
  we were faced with a de-motivated mortgage market when things hit the rails in late 2008, nobody was moving and the company was hemoraging money while trying to find it's feet against it's bigger competitors.  a lot of us began to get demotivated with so many different shifts in tasks, we had no control over the decisions even though a lot of us felt we were in the best position to make the difference, our hit concepts were being nabbed by competitors and things were beginning to turn into a 9-5 conveyorbelt of tasks we were given.  our investors started tightening their belts and so the squeeze was put on, although in the end most of us left before january.
 
  however, things have improved, i've kept in touch with my former colleagues and meet up regularly with them, we each have ideas and little projects we're trying out; regardless of what happened i'm grateful for the time spent there, made a lot of new friends and people i admire.
 
  Much like WSP, leaving there was a big decision.  I could have stayed on but I needed to spread my wings and push myself more and i've enjoyed it every step of the way.  I still chat to my old bosses and colleagues from all those jobs.
 

I've been offered roles in management but they just don't excite me as much as getting my hands dirty with code and working in the trenches, it's more influential and you gain more.


Open-Source


Motivational Needs Worksheet:
  ?
 
Resume Content:
  Contact Block
  Professional Summary
  Work Experience
  Education
  Other Achievements outside work
  List of Buzzwords and skills

## Design Notes

design notes

Code repetition

Under most circumstances, repetition is bad. The more repeated HTML and JSP code, the more difficult it is to develop and maintain an application. A simple change can result in a cascade of changes in many different pages with unpredictable consequences. A concrete and practical way of attaining reuse is to avoid code repetition.

Layout control

While code repetition is bad, repetition of layout logic and code can be worse. Spreading the logic and behavior of view component organization over several JSPs can be a recipe for disaster. Attaining reuse of templating and layout logic is a better form of reuse than only reusing view components. Thus, you can achieve a higher level of reuse with effective layout control.

Coupling

Coupling is the degree of interactivity between entities. Software engineers are taught again and again to minimize coupling between unrelated classes, packages, and so on. We can apply the same principle to view components. Even though there are distinct view components from a user perspective, in the JSP implementation, the components might be intricately coupled. A solution should reduce coupling between unrelated view components.

Complexity

Complexity brings increased development and maintenance costs, making a more complex solution less suitable. Complexity grows fast as well, and what might originally look simple and innocuous can quickly turn into a big mess as you add more pieces.

## Scrum Notes

Characteristics

Scrum is a "process skeleton," which contains sets of practices and predefined roles. The main roles in Scrum are: (1) the "ScrumMaster," who maintains the processes (typically in lieu of a project manager); (2) the "Product Owner," who represents the stakeholders; and (3) the "Team", a cross-functional group of about 7 people who do the actual analysis, design, implementation, testing, etc.
During each "sprint", typically a two to four week period (with the length being decided by the team), the team creates a potentially shippable product increment (for example, working and tested software). The set of features that go into a sprint come from the product "backlog", which is a prioritized set of high level requirements of work to be done. Which backlog items go into the sprint is determined during the sprint planning meeting. During this meeting, the Product Owner informs the team of the items in the product backlog that he wants completed. The team then determines how much of this they can commit to complete during the next sprint.[1] During a sprint, no one is allowed to change the sprint backlog, which means that the requirements are frozen for that sprint. After a sprint is completed, the team demonstrates the use of the software.
Scrum enables the creation of self-organizing teams by encouraging colocation of all team members, and verbal communication across all team members and disciplines that are involved in the project.
A key principle of Scrum is its recognition that during a project the customers can change their minds about what they want and need (often called requirements churn), and that unpredicted challenges cannot be easily addressed in a traditional predictive or planned manner. As such, Scrum adopts an empirical approach‚Äîaccepting that the problem cannot be fully understood or defined, focusing instead on maximizing the team's ability to deliver quickly and respond to emerging requirements.
There are several implementations of systems for managing the Scrum process, which range from yellow stickers and whiteboards, to software packages. One of Scrum's biggest advantages is that it is very easy to learn and requires little effort to start using.
[edit]Roles

Main article: The Chicken and the Pig
A number of roles are defined in Scrum. All roles fall into two distinct groups--pigs and chickens--based on the nature of their involvement in the development process. These groups get their names from a joke about a pig and a chicken opening a restaurant:[5]
A pig and a chicken are walking down a road. The chicken looks at the pig and says, "Hey, why don't we open a restaurant?" The pig looks back at the chicken and says, "Good idea, what do you want to call it?" The chicken thinks about it and says, "Why don't we call it 'Ham and Eggs'?" "I don't think so," says the pig, "I'd be committed, but you'd only be involved."
So the "pigs" are committed to building software regularly and frequently, while everyone else is a "chicken" - interested in the project but really indifferent because if it fails they're not the pigs - that is, they weren't the ones that committed to doing it. The needs, desires, ideas and influences of the chicken roles are taken into account, but are not in any way allowed to affect, distort or get in the way of the actual Scrum project.
[edit]"Pig" roles
The Pigs are the ones committed to the project in the Scrum process - they are the ones with "their bacon on the line."
Product Owner
The Product Owner represents the voice of the customer. He/she ensures that the Scrum Team works with the "right things" from a business perspective. The Product Owner writes customer-centric items (typically user stories), prioritizes them and then places them in the product backlog.
ScrumMaster (or Facilitator)
Scrum is facilitated by a ScrumMaster, whose primary job is to remove impediments to the ability of the team to deliver the sprint goal. The ScrumMaster is not the leader of the team (as the team is self-organizing) but acts as a buffer between the team and any distracting influences. The ScrumMaster ensures that the Scrum process is used as intended. The ScrumMaster is the enforcer of rules. A key part of the ScrumMaster's role is to protect the team and keep them focused on the tasks in hand. The ScrumMaster is NOT responsible for the transition from traditional methods of working to Scrum or the implementation of Scrum. .
Team
The team has the responsibility to deliver the product. A team is typically made up of 5‚Äì9 people with cross-functional skills who do the actual work (design, develop, test, technical communication, etc.).
[edit]"Chicken" roles
Chicken roles are not part of the actual Scrum process, but must be taken into account. An : People the software is being built for.
Stakeholders (customers, vendors)
These are the people who enable the project and for whom the project will produce the agreed-upon benefit[s], which justify its production. They are only directly involved in the process during the sprint reviews.
Managers
People who will set up the environment for the product development organizations.
[edit]Meetings

Daily Scrum
Each day during the sprint, a project status meeting occurs. This is called a "daily scrum", or "the daily standup". This meeting has specific guidelines:
The meeting starts precisely on time. Often there are team-decided punishments for tardiness (e.g. money, push-ups, hanging a rubber chicken around your neck)
All are welcome, but only "pigs" may speak
The meeting is timeboxed to 15 minutes
All attendees should stand (it helps to keep meeting short)
The meeting should happen at the same location and same time every day
During the meeting, each team member answers three questions:[6]
What have you done since yesterday?
What are you planning to do by today?
Do you have any problems preventing you from accomplishing your goal? (It is the role of the ScrumMaster to facilitate resolution of these impediments. Typically this should occur outside the context of the Daily Scrum so that it may stay under 15 minutes.)
Sprint Planning Meeting[7][8]
At the beginning of the sprint cycle (every 15‚Äì30 days), a "Sprint Planning Meeting" is held.
Select what work is to be done
Prepare the Sprint Backlog that details the time it will take to do that work, with the entire team
Identify and communicate how much of the work is likely to be done during the current sprint
Eight hour limit
At the end of a sprint cycle, two meetings are held: the "Sprint Review Meeting" and the "Sprint Retrospective"
Sprint Review Meeting[9]
Review the work that was completed and not completed
Present the completed work to the stakeholders (a.k.a. "the demo")
Incomplete work cannot be demonstrated
Four hour time limit
Sprint Retrospective[10]
All team members reflect on the past sprint.
Make continuous process improvement.
Two main questions are asked in the sprint retrospective: What went well during the sprint? What could be improved in the next sprint?
Three hour time limit
[edit]Artifacts

[edit]Product backlog
The product backlog is a high-level document for the entire project. It contains backlog items: broad descriptions of all required features, wish-list items, etc. prioritized by business value. It is the "What" that will be built. It is open and editable by anyone and contains rough estimates of both business value and development effort. Those estimates help the Product Owner to gauge the timeline and, to a limited extent, priority. For example, if the "add spellcheck" and "add table support" features have the same business value, the one with the smallest development effort will probably have higher priority, because the ROI is higher.
The product backlog is property of the Product Owner. Business value is set by the Product Owner. Development effort is set by the Team.
[edit]Sprint backlog
The sprint backlog is a document containing information about how the team is going to implement the features for the upcoming sprint. Features are broken down into tasks; as a best practice tasks are normally estimated between four and 16 hours of work. With this level of detail the whole team understands exactly what to do, and anyone can potentially pick a task from the list. Tasks on the sprint backlog are never assigned; rather, tasks are signed up for by the team members as needed, according to the set priority and the team member skills.
The sprint backlog is property of the Team. Estimations are set by the Team. Often an according Task Board is used to see and change the state of the tasks of the current sprint, like "to do", "in progress" and "done".
[edit]Burn down
The Sprint burn down chart is a publicly displayed chart showing remaining work in the sprint backlog. Updated every day, it gives a simple view of the sprint progress. It also provides quick visualizations for reference. There are also other types of burndown, for example the Release Burndown Chart that shows the amount of work left to complete the target commitment for a Product Release (normally spanning through multiple iterations) and the Alternative Release Burndown Chart[11], which basically does the same, but allows to show clearly scope changes into a Release Content, by resetting the baseline.
It should not be confused with an earned value chart.
[edit]Adaptive project management

The following are some general practices of Scrum:
Customers become a part of the development team (i.e., the customer must be genuinely interested in the output.)
Scrum has frequent intermediate deliveries with working functionality, like all other forms of agile software processes. This enables the customer to get working software earlier and enables the project to change its requirements according to changing needs.
Frequent risk and mitigation plans are developed by the development team itself‚Äîrisk mitigation, monitoring and management (risk analysis) occurs at every stage and with commitment.
Transparency in planning and module development‚Äîlet everyone know who is accountable for what and by when.
Frequent stakeholder meetings to monitor progress‚Äîbalanced dashboard updates (delivery, customer, employee, process, stakeholders)
There should be an advance warning mechanism, i.e., visibility to potential slippage or deviation ahead of time.
No problems are swept under the carpet. No one is penalized for recognizing or describing any unforeseen problem.
Workplaces and working hours must be energized‚Äî"Working more hours" does not necessarily mean "producing more output."
[edit]Terminology

The following terminology is used in Scrum:[12]
[edit]Roles

Product Owner
...The person responsible for maintaining the Product Backlog by representing the interests of the stakeholders.

ScrumMaster
...The person responsible for the Scrum process, making sure it is used correctly and maximizes its benefits.

Team
...A cross-functional group of people responsible for managing itself to develop the product.

Scrum Team
...Product Owner, ScrumMaster and Team

[edit]Artifacts

Sprint burn down chart
...Daily progress for a Sprint over the sprint's length.

Product backlog
...A prioritized list of high level requirements.

Sprint backlog
...A prioritized list of tasks to be completed during the sprint.

[edit]Others
Impediment
...Anything that prevents a team member from performing work as efficiently as possible.

Sprint
...A time period (typically between two weeks and one month) in which development occurs on a set of backlog items that the Team has committed to.

Sashimi
...A slice of the whole equivalent in content to all other slices of the whole. For the Daily Scrum, the slice of sashimi is a report that something is done.

Velocity
...How much product backlog effort a team can handle in one sprint. This can be estimated by viewing previous sprints, assuming the team composition and sprint duration are kept constant. It can also be established on a sprint-by-sprint basis, using commitment-based planning.

## Agile Design Philosophies

Agile designs are emergent, they’re not defined up front.  
...Your overall system design will emerge over time, evolving to fulfill new requirements and take advantage of new technologies as appropriate.  Although you will often do some initial architectural modeling at the very beginning of a project during “iteration 0” this will be just enough to get your team going.  Agilists don’t need to get a fully documented set of models in place before you may begin coding (although sometimes, just sometimes, you may need to model a bit ahead).
 
Your unit tests form much of your detailed design documentation.  
...With a test-driven development (TDD) approach to development you write a test and then you write just enough domain code to fulfill that test.  An important side effect of this approach is that your unit tests not only validate your code, they also form the majority of your design documentation in the form of executable specifications.  TDD is complementary to AMDD and is actually scaled by AMDD.

Design models need to be just barely good enough.  
...You don’t need to model every single detail in your models, the models don’t need to be perfect, and they certainly don’t need to be complete.  Remember the last time you coded from a design spec (if you ever did)?  Did you really look at all the fine-grained details?  No, because you were competent enough to handle the details yourself.

Multiple models.  
...Effective developers realize that each type of model has its strengths and weaknesses, therefore they need to apply the right model(s) for the job at hand.  Because software development is complex you quickly realize that you need to know about a wide range of models in order to be effective.  All of the models mentioned in this newsletter, and more, are described at the Agile Models Distilled page. 

You typically only need a subset of the models.  
...Although there are many modeling techniques available to your, the fact is that any given project team will only require a subset.  Think of it like this: in your toolbox at home you have a wide array of screwdrivers, wrenches, pliers, and so on.  For any given repair job you will use only a few of the tools.  Different jobs, different tools.  You never need all of your tools at once, but over time you will use them in a variety of manners.

Each model can be used for a variety of purposes.  
...A UML class diagram can be used to depict a high-level domain model or a low-level design, not to mention things in between.  Use cases can be used to model the essential nature of a process or the detailed system usage description which takes into account architectural decisions.  Never underestimate how flexible you can be with models. 

Designers should also code.  
...Whenever a model is handed over to someone else to code there is significant danger that the programmer will not understand the model, will miss some of its nuances, or may even ignore the model completely in favor of their own approach.  Furthermore, even when hand-offs are successful you will discover that you need far more details in your models than if you had simply coded it yourself.  In short, separating design from programming is a risky and expensive proposition.  It is far more effective to have generalizing specialists on your team that can both design and code.

Prove it with code. 
...Never assume your design works; instead, obtain concrete feedback by writing code to determine if it does in fact work.

Feedback is your friend. 
...Never forget that you are a mere mortal just like everyone else on your team.  Expect to receive feedback -- I suggest you actively seek it -- about your work and be prepared to consider it and act accordingly. Not only will your system be the better for it, you will likely learn something in the process.

Sometimes the simplest tool is a complex CASE tool.  
...When it comes to requirements I prefer inclusive tools such as paper and whiteboards, but when it comes to design I tend to lean towards sophisticated tools which (re)generate code for me.  Like my grandfather always said, you should use the right tool for the job.

Iterate, iterate, iterate. 
...With an iterative approach to development you work a bit on requirements, do a bit of analysis, do a bit of design, some coding, some testing, and iterate between these activities as needed.  You will also iterate back and forth between working on various artifacts, working on the right artifact at the right time.

Design is so important you should do it every day.  
...It is critical to think through how you’re going to build something, to actually design it, before you build it.  Your design efforts may take on the form of a sketch on a whiteboard, a detailed model created with a sophisticated modeling tool, or a simple test that you write before you write business code.  Agile developers realize that design is so important that they do it every day, that design isn’t just a phase that you do early in the project before getting to the “real work” of writing the source code.

Design for your implementation environment judiciously. 
...Take advantage of features of your implementation environment, but be smart about it. Trade-offs are normal, but understand the implications and manage the risks involved. Every time you take advantage of a unique performance enhancement in a product (such as a database, operating system, or middleware tool) you are likely coupling your system to that product and, thus, reducing its portability. To minimize the impact of your implementation environment on your systems, you can layer your software and wrap specific features to make them appear general to their users.

Document complicated things. 
...If it is complicated, then document it thoroughly.  Better yet, invest the time to design it so it is simple.  Remember the AM practice Create Simple Content.

Do not over document. 
...You need to document your design, but you shouldn’t over document either. Remember, users pay you to build systems, not to document them. There is a fine line between under documenting and over documenting, and only through experience are you able to find it.  Be as agile as possible when it comes to documentation.

Don't get sidetracked by the data community.  
...Unfortunately many within the data community believe that you require a serial approach to design, particularly when it comes to databases.  This belief is the result of either not understanding evolutionary development or some misguided need to identify the "one truth above all else".  Evolutionary database design techniques such as agile data modeling, database refactoring, and database regression testing work incredibly well in practice.

## Agile Process

Principles behind agile methods

See also: Agile Manifesto
Agile methods are a family of development processes, not a single approach to software development. In 2001, 17 prominent figures[4] in the field of agile development (then called "light-weight methods") came together at the Snowbird ski resort in Utah to discuss ways of creating software in a lighter, faster, more people-centric way. They coined the term Agile Software Development and created the Agile Manifesto, widely regarded as the canonical definition of agile development and accompanying agile principles. The Agile Manifesto states:
We are uncovering better ways of developing software by doing it and helping others do it. Through this work we have come to value:
Individuals and interactions over processes and tools
Working software over comprehensive documentation
Customer collaboration over contract negotiation
Responding to change over following a plan
That is, while there is value in the items on the right, we value the items on the left more.
Some of the principles behind the Agile Manifesto[5] are:
Customer satisfaction by rapid, continuous delivery of useful software
Working software is delivered frequently (weeks rather than months)
Working software is the principal measure of progress
Even late changes in requirements are welcomed (this does not mean code & run. Instead removing an existing feature or moving a deadline forward to accommodate late/unplanned feature requests[not in citation given])
Close, daily cooperation between business people and developers
Face-to-face conversation is the best form of communication (Co-location)
Projects are built around motivated individuals, who should be trusted
Continuous attention to technical excellence and good design
Simplicity
Self-organizing teams
Regular adaptation to changing circumstances
The manifesto spawned a movement in the software industry known as agile software development.
In 2005, Alistair Cockburn and Jim Highsmith gathered another group of people‚Äîmanagement experts, this time‚Äîand wrote an addendum, known as the PM Declaration of Interdependence.
The functioning principles of Agile can be found in lean manufacturing and six sigma. These concepts include error proofing, eliminating waste, creating flow, adding customer value, and empowering workers. The concepts were first formally espoused in the 14 principles of the Toyota Way, the two pillars of the Toyota Production System (Just-in-time and smart automation), the 5S methodology, and Deming‚Äôs 14 points. These have been summarized in the seven points of lean software development..
[edit]Comparison with other methods

Agile methods are sometimes characterized as being at the opposite end of the spectrum from "plan-driven" or "disciplined" methods. This distinction is misleading, as it implies that agile methods are "unplanned" or "undisciplined". A more accurate distinction is that methods exist on a continuum from "adaptive" to "predictive".[6] Agile methods lie on the "adaptive" side of this continuum.
Adaptive methods focus on adapting quickly to changing realities. When the needs of a project change, an adaptive team changes as well. An adaptive team will have difficulty describing exactly what will happen in the future. The further away a date is, the more vague an adaptive method will be about what will happen on that date. An adaptive team can report exactly what tasks are being done next week, but only which features are planned for next month. When asked about a release six months from now, an adaptive team may only be able to report the mission statement for the release, or a statement of expected value vs. cost.
Predictive methods, in contrast, focus on planning the future in detail. A predictive team can report exactly what features and tasks are planned for the entire length of the development process. Predictive teams have difficulty changing direction. The plan is typically optimized for the original destination and changing direction can cause completed work to be thrown away and done over differently. Predictive teams will often institute a change control board to ensure that only the most valuable changes are considered.
Agile methods have much in common with the "Rapid Application Development" techniques from the 1980/90s as espoused by James Martin and others.

[edit]Contrasted with other iterative development methods
Most agile methods share other iterative and incremental development methods' emphasis on building releasable software in short time periods. Agile development differs from other development models: in this model time periods are measured in weeks rather than months and work is performed in a highly collaborative manner. Most agile methods also differ by treating their time period as a strict timebox.
[edit]Contrasted with the waterfall model

Agile development has little in common with the waterfall model. As of 2004, the waterfall model is still in common use.[7]

The waterfall model is the most structured of the methods, stepping through requirements-capture, analysis, design, coding, and testing in a strict, pre-planned sequence. Progress is generally measured in terms of deliverable artifacts: requirement specifications, design documents, test plans, code reviews and the like.
The main problem with the waterfall model is the inflexible division of a project into separate stages, so that commitments are made early on, and it is difficult to react to changes in requirements. Iterations are expensive. This means that the waterfall model is likely to be unsuitable if requirements are not well understood or are likely to change in the course of the project.[8]

Agile methods, in contrast, produce completely developed and tested features (but a very small subset of the whole) every few weeks. The emphasis is on obtaining the smallest workable piece of functionality to deliver business value early, and continually improving it and adding further functionality throughout the life of the project. If a project being delivered under the waterfall method is cancelled at any point up to the end, there is nothing to show for it beyond a huge resources bill. With the agile method, being cancelled at any point will still leave the customer with some worthwhile code, that has likely already been put into live operation.

In this respect, agile critics[who?] may assert that these features are not placed in context of the overall project, concluding that, if the sponsors of the project are concerned about completing certain goals with a defined timeline or budget, agile may not be appropriate. Proponents of agile development counter that adaptations of Scrum[9] show how agile methods are augmented to produce and continuously improve a strategic plan.
Some agile teams use the waterfall model on a small scale, repeating the entire waterfall cycle in every iteration.[10] Other teams, most notably Extreme Programming teams, work on activities simultaneously.
[edit]Contrasted with "cowboy coding"

Cowboy coding is the absence of a defined method: team members do whatever they feel is right. Agile development's frequent re-evaluation of plans, emphasis on face-to-face communication, and relatively sparse use of documents sometimes causes people to confuse it with cowboy coding. Agile teams, however, do follow defined (and often very disciplined and rigorous) processes.[clarification needed]
As with all development methods, the skill and experience of the users determine the degree of success and/or abuse of such activity. The more rigid controls systematically embedded within a process offer stronger levels of accountability of the users. The degradation of well-intended procedures can lead to activities often categorized as cowboy coding.
[edit]Suitability of agile methods

There is little if any consensus on what types of software projects are best suited for the agile approach. Many large organizations have difficulty bridging the gap between the traditional waterfall method and an agile one.
Large scale agile software development remains an active research area.[11][12]
Agile development has been widely documented (see Experience Reports, below, as well as Beck[13] pg. 157, and Boehm and Turner[14] pg. 55-57) as working well for small (<10 developers) co-located teams.
Some things that can negatively impact the success of an agile project are:
Large scale development efforts (>20 developers), though scaling strategies[15] and evidence to the contrary[16] have been described.
Distributed development efforts (non-co-located teams). Strategies have been described in Bridging the Distance[17] and Using an Agile Software Process with Offshore Development[18]
Command-and-control company cultures[citation needed]
Forcing an agile process on a development team[citation needed]
Several successful large scale agile projects have been documented.[where?] BT has had several hundred developers situated in the UK, Ireland and India working collaboratively on projects and using Agile methods. While questions undoubtedly still arise about the suitability of some Agile methods to certain project types, it would appear that scale or geography, by themselves, are not necessarily barriers to success.[citation needed]
Barry Boehm and Richard Turner suggest that risk analysis be used to choose between adaptive ("agile") and predictive ("plan-driven") methods.[14] The authors suggest that each side of the continuum has its own home ground as follows:
Agile home ground:
Low criticality
Senior developers
Requirements change very often
Small number of developers
Culture that thrives on chaos
Plan-driven home ground:
High criticality
Junior developers
Requirements don't change too often
Large number of developers
Culture that demands order
Agile methods apply to only the development of software products because they exploit certain characteristics of software, such as object technologies and the ability to automate testing. For developing non-software products, such as machinery, electronic hardware, and food, a related set of techniques, known as flexible product development, are available.
[edit]Agile methods and method tailoring

In the literature, different terms refer to the notion of method adaptation, including ‚Äòmethod tailoring‚Äô, ‚Äòmethod fragment adaptation‚Äô and ‚Äòsituational method engineering‚Äô. Method tailoring is defined as:
A process or capability in which human agents through responsive changes in, and dynamic interplays between contexts, intentions, and method fragments determine a system development approach for a specific project situation.[19]
Potentially, almost all agile methods are suitable for method tailoring. Even the DSDM method is being used for this purpose and has been successfully tailored in a CMM context.[20] Situation-appropriateness can be considered as a distinguishing characteristic between agile methods and traditional software development methods, with the latter being relatively much more rigid and prescriptive. The practical implication is that agile methods allow project teams to adapt working practices according to the needs of individual projects. Practices are concrete activities and products that are part of a method framework. At a more extreme level, the philosophy behind the method, consisting of a number of principles, could be adapted (Aydin, 2004).[19]
Extreme Programming (XP) makes the need for method adaptation explicit. One of the fundamental ideas of XP is that not one process fits every project, but rather that practices should be tailored to the needs of individual projects. Partial adoption of XP practices, as suggested by Beck, has been reported on several occasions.[21] A tailoring practice is proposed by Mehdi Mirakhorli which provides sufficient roadmap and guideline for adapting all the practices. RDP Practice is designed for customizing XP. This practice first time proposed as a long research paper in APSO workshop at ICSE 2008 conference and yet it is the only proposed and applicable method for customizing XP. Although it is specifically a solution for XP, this practice has the capability of extending to other methodologies. At first glance, this practice seems to be in the category of static method adaptation but experiences with RDP Practice says that it can be treated like dynamic method adaptation. The distinction between static method adaptation and dynamic method adaptation is subtle.[22] The key assumption behind static method adaptation is that the project context is given at the start of a project and remains fixed during project execution. The result is a static definition of the project context. Given such a definition, route maps can be used in order to determine which structured method fragments should be used for that particular project, based on predefined sets of criteria. Dynamic method adaptation, in contrast, assumes that projects are situated in an emergent context. An emergent context implies that a project has to deal with emergent factors that affect relevant conditions but are not predictable. This also means that a project context is not fixed, but changing during project execution. In such a case prescriptive route maps are not appropriate. The practical implication of dynamic method adaptation is that project managers often have to modify structured fragments or even innovate new fragments, during the execution of a project (Aydin et al., 2005).[22]
[edit]Agile methods and project management

Agile methods differ to a large degree in the way they cover project management. Some methods are supplemented with guidelines on project management, but there is generally no comprehensive support.[20]
PMP has been suggested as a suitable, complementary project management system.
PRINCE2 has been suggested as a suitable, complementary project management system
