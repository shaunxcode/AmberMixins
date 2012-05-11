# Mixins 
##what
simple approach to mixins for smalltalk (specifically amber). Based on the article by Terry Montlick: [Implementing mixins in Smalltalk](http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CDkQFjAA&url=http%3A%2F%2Fcs.ua.edu%2F603%2Flectures%2Fchapter9d-smalltalk.pdf&ei=AW6tT_LoCqasiQL046CnBA&usg=AFQjCNGS5y_dtKBfnR5QkOpm1sdsWB-x6g). 

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
