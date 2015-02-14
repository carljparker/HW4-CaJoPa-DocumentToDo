
# HW4: NSDocument and Saving & Loading App Data #

## How was your experience making this app? ##

I did not find this HW to be quite as challenging as the previous one
(HW3). The most challenging thing about this HW was understanding how
the ToDoList object needed to be shared between the ViewController and
the NSDocument. Even after I learned that I needed to share the object,
it was still unclear to me how to navigate the class structure in
NSDocument to provide the ViewController a reference to the ToDoClass.
Here is the crucial code:

    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    [self addWindowController:wc];
    ((ViewController *) wc.contentViewController).toDoList = self.toDoList;

If I had not asked you how to do this, I think it would have taken me
a _long_ time to figure it out.

What was great about this HW is that I feel as though my app is much
more legit, now that it can save and load documents. 


## What resources did you find helpful? ##

Interestingly, I have not found StackOverflow to be very helpful at all
for the material in this class. The most helpful resources have been
NSHipster and, actually, the overview material in Apple's docs. Apple's
reference material is poor. (And I say this as someone who works as a
technical writer.)


## Ask one well-formed question or observation about the app, technologies used, or related topics. ##

At this point, the question that keeps coming up for me is: Where is my
app? From inside Xcode, I can build & run, but what if I want to give a
copy of my app to a friend or co-worker and have them run it? What is
the process for that?


## Fixed Issues and Open Known Issues ##

### Fixed Issues and How I Fixed Them ###

Here are a couple issues that I ran into and how I fixed them.

- Sometimes, the document Windows wouldn't appear when the program
  started. I was able to fix this by going into: 

> **Edit Scheme...** | **Options**

    and setting the following option:

> **Launch application without state restoration:** YES

- Sometimes, the document window would appear, but it wouldn't display
  the contents from the convenience constructor until I added an
  additional item. I was able to fix this by calling the
  ViewController's `UpdateUI` method from the NSDocument.

      [((ViewController *) wc.contentViewController) updateUI];

  Again, the key thing that I learned here was how to navigate the class
  structure from the NSDocument to the ViewController.


### Open Known Issues ###

- I get the following diagnostic in the debug output window, when I
  first start the app. 

      Could not connect action, target class ViewController does not respond
      to -addTextOnReturn:
  
  I have not tracked this down; it doesn't _seem_ to obstruct the
  functionality of the app. 

*** END ***

