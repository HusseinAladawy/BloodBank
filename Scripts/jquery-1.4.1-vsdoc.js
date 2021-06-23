/*
 * This file has been commented to support Visual Studio Intellisense.
 * You should not use this file at runtime inside the browser--it is only
 * intended to be used only for design-time IntelliSense.  Please use the
 * standard jQuery library for all production use.
 *
 * Comment version: 1.4.1a
 */

/*!
 * jQuery JavaScript Library v1.4.1
 * http://jquery.com/
 *
 * Distributed in whole under the terms of the MIT
 *
 * Copyright 2010, John Resig
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2010, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Mon Jan 25 19:43:33 2010 -0500
 */

(function( window, undefined ) {

// Define a local copy of jQuery
var jQuery = function( selector, context ) {
		///	<summary>
		///		1: $(expression, context) - This function accepts a string containing a CSS selector which is then used to match a set of elements.
		///		2: $(html) - Create DOM elements on-the-fly from the provided String of raw HTML.
		///		3: $(elements) - Wrap jQuery functionality around a single or multiple DOM Element(s).
		///		4: $(callback) - A shorthand for $(document).ready().
		///		5: $() - As of jQuery 1.4, if you pass no arguments in to the jQuery() method, an empty jQuery set will be returned.
		///	</summary>
		///	<param name="selector" type="String">
		///		1: expression - An expression to search with.
		///		2: html - A string of HTML to create on the fly.
		///		3: elements - DOM element(s) to be encapsulated by a jQuery object.
		///		4: callback - The function to execute when the DOM is ready.
		///	</param>
		///	<param name="context" type="jQuery">
		///		1: context - A DOM Element, Document or jQuery to use as context.
		///	</param>
		///	<returns type="jQuery" />

		// The jQuery object is actually just the init constructor 'enhanced'
		return new jQuery.fn.init( selector, context );
	},

	// Map over jQuery in case of overwrite
	_jQuery = window.jQuery,

	// Map over the $ in case of overwrite
	_$ = window.$,

	// Use the correct document accordingly with window argument (sandbox)
	document = window.document,

	// A central reference to the root jQuery(document)
	rootjQuery,

	// A simple way to check for HTML strings or ID strings
	// (both of which we optimize for)
	quickExpr = /^[^<]*(<[\w\W]+>)[^>]*$|^#([\w-]+)$/,

	// Is it a simple selector
	isSimple = /^.[^:#\[\.,]*$/,

	// Check if a string has a non-whitespace character in it
	rnotwhite = /\S/,

	// Used for trimming whitespace
	rtrim = /^(\s|\u00A0)+|(\s|\u00A0)+$/g,

	// Match a standalone tag
	rsingleTag = /^<(\w+)\s*\/?>(?:<\/\1>)?$/,

	// Keep a UserAgent string for use with jQuery.browser
	userAgent = navigator.userAgent,

	// For matching the engine and version of the browser
	browserMatch,
	
	// Has the ready events already been bound?
	readyBound = false,
	
	// The functions to execute on DOM ready
	readyList = [],

	// The ready event handler
	DOMContentLoaded,

	// Save a reference to some core methods
	toString = Object.prototype.toString,
	hasOwnProperty = Object.prototype.hasOwnProperty,
	push = Array.prototype.push,
	slice = Array.prototype.slice,
	indexOf = Array.prototype.indexOf;

jQuery.fn = jQuery.prototype = {
	init: function( selector, context ) {

		var match, elem, ret, doc;

		// Handle $(""), $(null), or $(undefined)
		if ( !selector ) {
			return this;
		}

		// Handle $(DOMElement)
		if ( selector.nodeType ) {
			this.context = this[0] = selector;
			this.length = 1;
			return this;
		}

		// Handle HTML strings
		if ( typeof selector === "string" ) {
			// Are we dealing with HTML string or an ID?
			match = quickExpr.exec( selector );

			// Verify a match, and that no context was specified for #id
			if ( match && (match[1] || !context) ) {

				// HANDLE: $(html) -> $(array)
				if ( match[1] ) {
					doc = (context ? context.ownerDocument || context : document);

					// If a single string is passed in and it's a single tag
					// just do a createElement and skip the rest
					ret = rsingleTag.exec( selector );

					if ( ret ) {
						if ( jQuery.isPlainObject( context ) ) {
							selector = [ document.createElement( ret[1] ) ];
							jQuery.fn.attr.call( selector, context, true );

						} else {
							selector = [ doc.createElement( ret[1] ) ];
						}

					} else {
						ret = buildFragment( [ match[1] ], [ doc ] );
						selector = (ret.cacheable ? ret.fragment.cloneNode(true) : ret.fragment).childNodes;
					}

				// HANDLE: $("#id")
				} else {
					elem = document.getElementById( match[2] );

					if ( elem ) {
						// Handle the case where IE and Opera return items
						// by name instead of ID
						if ( elem.id !== match[2] ) {
							return rootjQuery.find( selector );
						}

						// Otherwise, we inject the element directly into the jQuery object
						this.length = 1;
						this[0] = elem;
					}

					this.context = document;
					this.selector = selector;
					return this;
				}

			// HANDLE: $("TAG")
			} else if ( !context && /^\w+$/.test( selector ) ) {
				this.selector = selector;
				this.context = document;
				selector = document.getElementsByTagName( selector );

			// HANDLE: $(expr, $(...))
			} else if ( !context || context.jquery ) {
				return (context || rootjQuery).find( selector );

			// HANDLE: $(expr, context)
			// (which is just equivalent to: $(context).find(expr)
			} else {
				return jQuery( context ).find( selector );
			}

		// HANDLE: $(function)
		// Shortcut for document ready
		} else if ( jQuery.isFunction( selector ) ) {
			return rootjQuery.ready( selector );
		}

		if (selector.selector !== undefined) {
			this.selector = selector.selector;
			this.context = selector.context;
		}

		return jQuery.isArray( selector ) ?
			this.setArray( selector ) :
			jQuery.makeArray( selector, this );
	},

	// Start with an empty selector
	selector: "",

	// The current version of jQuery being used
	jquery: "1.4.1",

	// The default length of a jQuery object is 0
	length: 0,

	// The number of elements contained in the matched element set
	size: function() {
		///	<summary>
		///		The number of elements currently matched.
		///		Part of Core
		///	</summary>
		///	<returns type="Number" />

		return this.length;
	},

	toArray: function() {
		///	<summary>
		///		Retrieve all the DOM elements contained in the jQuery set, as an array.
		///	</summary>
		///	<returns type="Array" />
		return slice.call( this, 0 );
	},

	// Get the Nth element in the matched element set OR
	// Get the whole matched element set as a clean array
	get: function( num ) {
		///	<summary>
		///		Access a single matched element. num is used to access the
		///		Nth element matched.
		///		Part of Core
		///	</summary>
		///	<returns type="Element" />
		///	<param name="num" type="Number">
		///		Access the element in the Nth position.
		///	</param>

		return num == null ?

			// Return a 'clean' array
			this.toArray() :

			// Return just the object
			( num < 0 ? this.slice(num)[ 0 ] : this[ num ] );
	},

	// Take an array of elements and push it onto the stack
	// (returning the new matched element set)
	pushStack: function( elems, name, selector ) {
		///	<summary>
		///		Set the jQuery object to an array of elements, while maintaining
		///		the stack.
		///		Part of Core
		///	</summary>
		///	<returns type="jQuery" />
		///	<param name="elems" type="Elements">
		///		An array of elements
		///	</param>

		// Build a new jQuery matched element set
		var ret = jQuery( elems || null );

		// Add the old object onto the stack (as a reference)
		ret.prevObject = this;

		ret.context = this.context;

		if ( name === "find" ) {
			ret.selector = this.selector + (this.selector ? " " : "") + selector;
		} else if ( name ) {
			ret.selector = this.selector + "." + name + "(" + selector + ")";
		}

		// Return the newly-formed element set
		return ret;
	},

	// Force the current matched set of elements to become
	// the specified array of elements (destroying the stack in the process)
	// You should use pushStack() in order to do this, but maintain the stack
	setArray: function( elems ) {
		///	<summary>
		///		Set the jQuery object to an array of elements. This operation is
		///		completely destructive - be sure to use .pushStack() if you wish to maintain
		///		the jQuery stack.
		///		Part of Core
		///	</summary>
		///	<returns type="jQuery" />
		///	<param name="elems" type="Elements">
		///		An array of elements
		///	</param>

		// Resetting the length to 0, then using the native Array push
		// is a super-fast way to populate an object with array-like properties
		this.length = 0;
		push.apply( this, elems );

		return this;
	},

	// Execute a callback for every element in the matched set.
	// (You can seed the arguments with an array of args, but this is
	// only used internally.)
	each: function( callback, args ) {
		///	<summary>
		///		Execute a function within the context of every matched element.
		///		This means that every time the passed-in function is executed
		///		(which is once for every element matched) the 'this' keyword
		///		points to the specific element.
		///		Additionally, the function, when executed, is passed a single
		///		argument representing the position of the element in the matched
		///		set.
		///		Part of Core
		///	</summary>
		///	<returns type="jQuery" />
		///	<param name="callback" type="Function">
		///		A function to execute
		///	</param>

		return jQuery.each( this, callback, args );
	},
	
	ready: function( fn ) {
		///	<summary>
		///		Binds a function to be executed whenever the DOM is ready to be traversed and manipulated.
		///	</summary>
		///	<param name="fn" type="Function">The function to be executed when the DOM is ready.</param>

		// Attach the listeners
		jQuery.bindReady();

		// If the DOM is already ready
		if ( jQuery.isReady ) {
			// Execute the function immediately
			fn.call( document, jQuery );

		// Otherwise, remember the function for later
		} else if ( readyList ) {
			// Add the function to the wait list
			readyList.push( fn );
		}

		return this;
	},
	
	eq: function( i ) {
		///	<summary>
		///		Reduce the set of matched elements to a single element.
		///		The position of the element in the set of matched elements
		///		starts at 0 and goes to length - 1.
		///		Part of Core
		///	</summary>
		///	<returns type="jQuery" />
		///	<param name="num" type="Number">
		///		pos The index of the element that you wish to limit to.
		///	</param>

		return i === -1 ?
			this.slice( i ) :
			this.slice( i, +i + 1 );
	},

	first: function() {
		///	<summary>
		///		Reduce the set of matched elements to the first in the set.
		///	</summary>
		///	<returns type="jQuery" />

		return this.eq( 0 );
	},

	last: function() {
		///	<summary>
		///		Reduce the set of matched elements to the final one in the set.
		///	</summary>
		///	<returns type="jQuery" />

		return this.eq( -1 );
	},

	slice: function() {
		///	<summary>
		///		Selects a subset of the matched elements.  Behaves exactly like the built-in Array slice method.
		///	</summary>
		///	<param name="start" type="Number" integer="true">Where to start the subset (0-based).</param>
		///	<param name="end" optional="true" type="Number" integer="true">Where to end the subset (not including the end element itself).
		///		If omitted, ends at the end of the selection</param>
		///	<returns type="jQuery">The sliced elements</returns>

		return this.pushStack( slice.apply( this, arguments ),
			"slice", slice.call(arguments).join(",") );
	},

	map: function( callback ) {
		///	<summary>
		///		This member is internal.
		///	</summary>
		///	<private />
		///	<returns type="jQuery" />

		return this.pushStack( jQuery.map(this, function( elem, i ) {
			return callback.call( elem, i, elem );
		}));
	},
	
	end: function() {
		///	<summary>
		///		End the most recent 'destructive' operation, reverting the list of matched elements
		///		back to its previous state. After an end operation, the list of matched elements will
		///		revert to the last state of matched elements.
		///		If there was no destructive operation before, an empty set is returned.
		///		Part of DOM/Traversing
		///	</summary>
		///	<returns type="jQuery" />

		return this.prevObject || jQuery(null);
	},

	// For internal use only.
	// Behaves like an Array's method, not like a jQuery method.
	push: push,
	sort: [].sort,
	splice: [].splice
};

// Give the init function the jQuery prototype for later instantiation
jQuery.fn.init.prototype = jQuery.fn;

jQuery.extend = jQuery.fn.extend = function() {
	///	<summary>
	///		Extend one object with one or more others, returning the original,
	///		modified, object. This is a great utility for simple inheritance.
	///		jQuery.extend(settings, options);
	///		var settings = jQuery.extend({}, defaults, options);
	///		Part of JavaScript
	///	</summary>
	///	<param name="target" type="Object">
	///		 The object to extend
	///	</param>
	///	<param name="prop1" type="Object">
	///		 The object that will be merged into the first.
	///	</param>
	///	<param name="propN" type="Object" optional="true" parameterArray="true">
	///		 (optional) More objects to merge into the first
	///	</param>
	///	<returns type="Object" />

	// copy reference to target object
	var target = arguments[0] || {}, i = 1, length = arguments.length, deep = false, options, name, src, copy;

	// Handle a deep copy situation
	if ( typeof target === "boolean" ) {
		deep = target;
		target = arguments[1] || {};
		// skip the boolean and the target
		i = 2;
	}

	// Handle case when target is a string or something (possible in deep copy)
	if ( typeof target !== "object" && !jQuery.isFunction(target) ) {
		target = {};
	}

	// extend jQuery itself if only one argument is passed
	if ( length === i ) {
		target = this;
		--i;
	}

	for ( ; i < length; i++ ) {
		// Only deal with non-null/undefined values
		if ( (options = arguments[ i ]) != null ) {
			// Extend the base object
			for ( name in options ) {
				src = target[ name ];
				copy = options[ name ];

				// Prevent never-ending loop
				if ( target === copy ) {
					continue;
				}

				// Recurse if we're merging object literal values or arrays
				if ( deep && copy && ( jQuery.isPlainObject(copy) || jQuery.isArray(copy) ) ) {
					var clone = src && ( jQuery.isPlainObject(src) || jQuery.isArray(src) ) ? src
						: jQuery.isArray(copy) ? [] : {};

					// Never move original objects, clone them
					target[ name ] = jQuery.extend( deep, clone, copy );

				// Don't bring in undefined values
				} else if ( copy !== undefined ) {
					target[ name ] = copy;
				}
			}
		}
	}

	// Return the modified object
	return target;
};

jQuery.extend({
	noConflict: function( deep ) {
		///	<summary>
		///		Run this function to give control of the $ variable back
		///		to whichever library first implemented it. This helps to make 
		///		sure that jQuery doesn't conflict with the $ object
		///		of other libraries.
		///		By using this function, you will only be able to access jQuery
		///		using the 'jQuery' variable. For example, where you used to do
		///		$(&quot;div p&quot;), you now must do jQuery(&quot;div p&quot;).
		///		Part of Core 
		///	</summary>
		///	<returns type="undefined" />

		window.$ = _$;

		if ( deep ) {
			window.jQuery = _jQuery;
		}

		return jQuery;
	},
	
	// Is the DOM ready to be used? Set to true once it occurs.
	isReady: false,
	
	// Handle when the DOM is ready
	ready: function() {
		///	<summary>
		///		This method is internal.
		///	</summary>
		///	<private />

		// Make sure that the DOM is not already loaded
		if ( !jQuery.isReady ) {
			// Make sure body exists, at least, in case IE gets a little overzealous (ticket #5443).
			if ( !document.body ) {
				return setTimeout( jQuery.ready, 13 );
			}

			// Remember that the DOM is ready
			jQuery.isReady = true;

			// If there are functions bound, to execute
			if ( readyList ) {
				// Execute all of them
				var fn, i = 0;
				while ( (fn = readyList[ i++ ]) ) {
					fn.call( document, jQuery );
				}

				// Reset the list of functions
				readyList = null;
			}

			// Trigger any bound ready events
			if ( jQuery.fn.triggerHandler ) {
				jQuery( document ).triggerHandler( "ready" );
			}
		}
	},
	
	bindReady: function() {
		if ( readyBound ) {
			return;
		}

		readyBound = true;

		// Catch cases where $(document).ready() is called after the
		// browser event has already occurred.
		if ( document.readyState === "complete" ) {
			return jQuery.ready();
		}

		// Mozilla, Opera and webkit nightlies currently support this event
		if ( document.addEventListener ) {
			// Use the handy event callback
			document.addEventListener( "DOMContentLoaded", DOMContentLoaded, false );
			
			// A fallback to window.onload, that will always work
			window.addEventListener( "load", jQuery.ready, false );

		// If IE event model is used
		} else if ( document.attachEvent ) {
			// ensure firing before onload,
			// maybe late but safe also for iframes
			document.attachEvent("onreadystatechange", DOMContentLoaded);
			
			// A fallback to window.onload, that will always work
			window.attachEvent( "onload", jQuery.ready );

			// If IE and not a frame
			// continually check to see if the document is ready
			var toplevel = false;

			try {
				toplevel = window.frameElement == null;
			} catch(e) {}

			if ( document.documentElement.doScroll && toplevel ) {
				doScrollCheck();
			}
		}
	},

	// See test/unit/core.js for details concerning isFunction.
	// Since version 1.3, DOM methods and functions like alert
	// aren't supported. They return false on IE (#2968).
	isFunction: function( obj ) {
		///	<summary>
		///		Determines if the parameter passed is a function.
		///	</summary>
		///	<param name="obj" type="Object">The object to check</param>
		///	<returns type="Boolean">True if the parameter is a function; otherwise false.</returns>

		return toString.call(obj) === "[object Function]";
	},

	isArray: function( obj ) {
		///	<summary>
		///		Determine if the parameter passed is an array.
		///	</summary>
		///	<param name="obj" type="Object">Object to test whether or not it is an array.</param>
		///	<returns type="Boolean">True if the parameter is a function; otherwise false.</returns>

		return toString.call(obj) === "[object Array]";
	},

	isPlainObject: function( obj ) {
		///	<summary>
		///		Check to see if an object is a plain object (created using "{}" or "new Object").
		///	</summary>
		///	<param name="obj" type="Object">
		///		The object that will be checked to see if it's a plain object.
		///	</param>
		///	<returns type="Boolean" />

		// Must be an Object.
		// Because of IE, we also have to check the presence of the constructor property.
		// Make sure that DOM nodes and window objects don't pass through, as well
		if ( !obj || toString.call(obj) !== "[object Object]" || obj.nodeType || obj.setInterval ) {
			return false;
		}
		
		// Not own constructor property must be Object
		if ( obj.constructor
			&& !hasOwnProperty.call(obj, "constructor")
			&& !hasOwnProperty.call(obj.constructor.prototype, "isPrototypeOf") ) {
			return false;
		}
		
		// Own properties are enumerated firstly, so to speed up,
		// if last one is own, then all properties are own.
	
		var key;
		for ( key in obj ) {}
		
		return key === undefined || hasOwnProperty.call( obj, key );
	},

	isEmptyObject: function( obj ) {
		///	<summary>
		///		Check to see if an object is empty (contains no properties).
		///	</summary>
		///	<param name="obj" type="Object">
		///		The object that will be checked to see if it's empty.
		///	</param>
		///	<returns type="Boolean" />

		for ( var name in obj ) {
			return false;
		}
		return true;
	},
	
	error: function( msg ) {
		throw msg;
	},
	
	parseJSON: function( data ) {
		if ( typeof data !== "string" || !data ) {
			return null;
		}
		
		// Make sure the incoming data is actual JSON
		// Logic borrowed from http://json.org/json2.js
		if ( /^[\],:{}\s]*$/.test(data.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@")
			.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]")
			.replace(/(?:^|:|,)(?:\s*\[)+/g, "")) ) {

			// Try to use the native JSON parser first
			return window.JSON && window.JSON.parse ?
				window.JSON.parse( data ) :
				(new Function("return " + data))();

		} else {
			jQuery.error( "Invalid JSON: " + data );
		}
	},

	noop: function() {
		///	<summary>
		///		An empty function.
		///	</summary>
		///	<returns type="Function" />
	},

	// Evalulates a script in a global context
	globalEval: function( data ) {
		///	<summary>
		///		Internally evaluates a script in a global context.
		///	</summary>
		///	<private />

		if ( data && rnotwhite.test(data) ) {
			// Inspired by code by Andrea Giammarchi
			// http://webreflection.blogspot.com/2007/08/global-scope-evaluation-and-dom.html
			var head = document.getElementsByTagName("head")[0] || document.documentElement,
				script = document.createElement("script");

			script.type = "text/javascript";

			if ( jQuery.support.scriptEval ) {
				script.appendChild( document.createTextNode( data ) );
			} else {
				script.text = data;
			}

			// Use insertBefore instead of appendChild to circumvent an IE6 bug.
			// This arises when a base node is used (#2709).
			head.insertBefore( script, head.firstChild );
			head.removeChild( script );
		}
	},

	nodeName: function( elem, name ) {
		///	<summary>
		///		Checks whether the specified element has the specified DOM node name.
		///	</summary>
		///	<param name="elem" type="Element">The element to examine</param>
		///	<param name="name" type="String">The node name to check</param>
		///	<returns type="Boolean">True if the specified node name matches the node's DOM node name; otherwise false</returns>

		return elem.nodeName && elem.nodeName.toUpperCase() === name.toUpperCase();
	},

	// args is for internal usage only
	each: function( object, callback, args ) {
		///	<summary>
		///		A generic iterator function, which can be used to seemlessly
		///		iterate over both objects and arrays. This function is not the same
		///		as $().each() - which is used to iterate, exclusively, over a jQuery
		///		object. This function can be used to iterate over anything.
		///		The callback has two arguments:the key (objects) or index (arrays) as first
		///		the first, and the value as the second.
		///		Part of JavaScript
		///	</summary>
		///	<param name="obj" type="Object">
		///		 The object, or array, to iterate over.
		///	</param>
		///	<param name="fn" type="Function">
		///		 The function that will be executed on every object.
		///	</param>
		///	<returns type="Object" />

		var name, i = 0,
			length = object.length,
			isObj = length === undefined || jQuery.isFunction(object);

		if ( args ) {
			if ( isObj ) {
				for ( name in object ) {
					if ( callback.apply( object[ name ], args ) === false ) {
						break;
					}
				}
			} else {
				for ( ; i < length; ) {
					if ( callback.apply( object[ i++ ], args ) === false ) {
						break;
					}
				}
			}

		// A special, fast, case for the most common use of each
		} else {
			if ( isObj ) {
				for ( name in object ) {
					if ( callback.call( object[ name ], name, object[ name ] ) === false ) {
						break;
					}
				}
			} else {
				for ( var value = object[0];
					i < length && callback.call( value, i, value ) !== false; value = object[++i] ) {}
			}
		}

		return object;
	},

	trim: function( text ) {
		///	<summary>
		///		Remove the whitespace from the beginning and end of a string.
		///		Part of JavaScript
		///	</summary>
		///	<returns type="String" />
		///	<param name="text" type="String">
		///		The string to trim.
		///	</param>

		return (text || "").replace( rtrim, "" );
	},

	// results is for internal usage only
	makeArray: function( array, results ) {
		///	<summary>
		///		Turns anything into a true array.  This is an internal method.
		///	</summary>
		///	<param name="array" type="Object">Anything to turn into an actual Array</param>
		///	<returns type="Array" />
		///	<private />

		var ret = results || [];

		if ( array != null ) {
			// The window, strings (and functions) also have 'length'
			// The extra typeof function check is to prevent crashes
			// in Safari 2 (See: #3039)
			if ( array.length == null || typeof array === "string" || jQuery.isFunction(array) || (typeof array !== "function" && array.setInterval) ) {
				push.call( ret, array );
			} else {
				jQuery.merge( ret, array );
			}
		}

		return ret;
	},

	inArray: function( elem, array ) {
		if ( array.indexOf ) {
			return array.indexOf( elem );
		}

		for ( var i = 0, length = array.length; i < length; i++ ) {
			if ( array[ i ] === elem ) {
				return i;
			}
		}

		return -1;
	},

	merge: function( first, second ) {
		///	<summary>
		///		Merge two arrays together, removing all duplicates.
		///		The new array is: All the results from the first array, followed
		///		by the unique results from the second array.
		///		Part of JavaScript
		///	</summary>
		///	<returns type="Array" />
		///	<param name="first" type="Array">
		///		 The first array to merge.
		///	</param>
		///	<param name="second" type="Array">
		///		 The second array to merge.
		///	</param>

		var i = first.length, j = 0;

		if ( typeof second.length === "number" ) {
			for ( var l = second.length; j < l; j++ ) {
				first[ i++ ] = second[ j ];
			}
		} else {
			while ( second[j] !== undefined ) {
				first[ i++ ] = second[ j++ ];
			}
		}

		first.length = i;

		return first;
	},

	grep: function( elems, callback, inv ) {
		///	<summary>
		///		Fil