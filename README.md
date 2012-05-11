# Mixins 
##what
simple approach to mixins for smalltalk (specifically amber). Based on the article by Terry Montlick: [Implementing mixins in Smalltalk](http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&sqi=2&ved=0CF0QFjAB&url=http%3A%2F%2Fwww.macqueen.us%2FsmalltalkReport%2FST%2FST07%2F14mo.pdf&ei=x3atT5fBMYSViAK_xZH9Aw&usg=AFQjCNGSzBqb0bI7DZ4ALF7wxyhRASKUJA). 

##Usage
Any class which you want to utilize mixins must respond to ```mixins``` which returns a ```Collection``` containing the other class instances which should be mixed in. 

##Example

```
Object subclass: #Example
        instanceVariableNames: 'mixins'
        
initialize
        "initialize mixins collection"
        mixins := Dictionary new.
        mixins at: #Events put: new Events.

mixins
        ^mixins


```
Imagining for a moment that we have an Events class which provides ```on:do``` and ```trigger:``` messages. 

```
| exampleInstance |
exampleInstance := new Example.
exampleInstance on: #someEvent do: [console log: 'called someEvent'].
exampleInstance trigger: #someEvent.
```
