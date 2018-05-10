# OGHAM TO-DO LIST, NOTES, ETC.  
## TO DO  
- Maybe make a new CSS class for the content area of the home and about page so that there is no empty white space to the left-hand side?
- The sequence template will need to use something different than a for-each--I don't want to show all the sequences at once
- Can I make it so that when you click on an association character image with the index local nav, you go to that character with the index local nav, and when you click on it with the hierarchy local nav, you go to it with the hierarchy local nav?
- Question: It seems unnecessary having to go back and add externally a hierarchy specification—it seems like everything I need to generate the hierarchy should be in the items themselves. Is this true? Can I make the hierarchy a complete innie?
- Fancy stuff like getting only the first pronunciation when rendering, not getting “Meaning:” in front of the second meaning in my render, etc.
- Take the currently-displayed character OUT of the listing of related characters
- Add remaining Ogham to instance
- I’m currently using the optional language attribute only for alternate (second) pronunciations. Use it for primary pronunciations? What is the language there? Modern Irish?
- Add a note somewhere about the verses: What language is the one that isn’t English? Something about the texts?
- Go back and check meanings for those I left out where meaning was uncertain, etc.?
- What’s up with the different pronunciations on the Ogham wiki page? Different meanings between the Ogham page and the Briatharogam page?
- Consistency between “X tree” and just “X”?
- Make my links open in new tabs (what was the attribute for this again?)
- Add some inscriptions. Inscriptions involving specific Ogham could be displayed in that Ogham’s full view
- I also ditched my notes div from the full-view prototype—it’d be nice to put it back if possible
- Note in about that it seems to me that meanings and arboreal traditions are really two things and should be separated, but that I don’t know enough about how to determine which is which to do that, so I’ve just combined them into “meanings”
## RE: THREE REQUIRED ELEMENTS/ATTRIBUTE for each item  
- ID: This attribute will be called ID, will be the letter (as with the letter [title] element, but maybe with something to distinguish it, for example if letter is a ID could be _oa
- title: Will be called letter instead of title, will be the letter (as with the ID attribute)
- description: will be called pronunciation 
## OTHER NOTES  
- I’m tending towards capitalizing the beginning of words/fragments such as pronunciations, plant associations, etc.
- Put in alternate family names somewhere (B group, H group, etc.)?
- I was conflating “meaning” and “arboreal tradition”—newly added both elements to schema (insert note somewhere about how—at least as far as I can tell—sometimes the plant association comes from an Ogham’s meaning and sometimes from an association with an arboreal tradition?
- So far one instance (Coll) where meaning “hazel tree” and arboreal tradition “hazel” are same. I’ve included them both.
## DONE  
- Put in some sources.
	- Sources that will be used for every single character are:
		- Ogham Wiki
		- Bríatharogam Wiki
		- Wikimedia Commons for images
- Automate insertion of Unicode Ogham in the middle of the ᚛      ᚜ ? If so, do I need an element for each character’s Unicode?
- I just put a line break in before the image.
- Add some attributes: Check course book. I think that the minimum number of attributes for my items is five.
- Remove arborealTradition element and just use meaning element? I’m not clear on where different meanings come from. Where else will this require changes? Just in hierarchy?
- Get my hierarchy dialed in so that the bottom level is categories with MULTIPLE IdRefs, is I think the bottom line.
