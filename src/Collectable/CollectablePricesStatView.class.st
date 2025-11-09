Class {
	#name : 'CollectablePricesStatView',
	#superclass : 'MolAbstractComponentImpl',
	#traits : 'CollectableView + CollectableCollectionsManagerEvents + CollectableViewServices',
	#classTraits : 'CollectableView classTrait + CollectableCollectionsManagerEvents classTrait + CollectableViewServices classTrait',
	#instVars : [
		'view',
		'space',
		'collection'
	],
	#category : 'Collectable-UI',
	#package : 'Collectable',
	#tag : 'UI'
}

{ #category : 'pyramid-serialized-bloc' }
CollectablePricesStatView class >> pyView [
	"This class has been generated using Pyramid.

	By: 
	2025-11-09 16:15:49"

	<pyStash>
	^ [ {(BlElement new
   background: (BlPaintBackground new
         paint: (BlColorPaint new
               color: (Color r: 0.6471163245356794 g: 0.6432062561094819 b: 0.6432062561094819 alpha: 1.0);
               yourself);
         opacity: 1.0;
         yourself);
   constraintsDo: [:constraints |  constraints horizontal matchParent.
      constraints vertical matchParent ];
   id: #pane;
   layout: BlFlowLayout horizontal;
   addChildren: {(BlElement new
         background: (BlPaintBackground new
               paint: (BlColorPaint new
                     color: (Color r: 0.4604105571847507 g: 0.2541544477028348 b: 0.9745845552297165 alpha: 1.0);
                     yourself);
               opacity: 1.0;
               yourself);
         constraintsDo: [:constraints |  constraints horizontal matchParent.
            constraints padding: (BlInsets all: 5.0) ];
         id: #topBar;
         layout: BlFlowLayout horizontal;
         addChildren: {(BlTextElement new
               text: (BlRopedText new
                     rope: (BlAttributeRope attributes: {(BlFontSizeAttribute new
                                 size: 14;
                                 yourself) . 
                              (BlTextForegroundAttribute new
                                 paint: (Color r: 1.0 g: 1.0 b: 1.0 alpha: 1.0);
                                 yourself)} rope: (BlCollectionRope new
                                 collection: 'Month average:';
                                 yourself));
                     yourself);
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical matchParent ];
               id: #averageTitle;
               yourself) . 
            (BlTextElement new
               text: (BlRopedText new
                     rope: (BlAttributeRope attributes: {(BlFontSizeAttribute new
                                 size: 12;
                                 yourself)} rope: (BlCollectionRope new
                                 collection: '-- €$';
                                 yourself));
                     yourself);
               constraintsDo: [:constraints |  constraints horizontal fitContent.
                  constraints vertical fitContent ];
               id: #averageValue;
               yourself)};
         yourself)};
   yourself)} ] value
]

{ #category : 'ui' }
CollectablePricesStatView >> closeSpace [

	space ifNil:[ ^ self ].
	space isOpened ifTrue:[ space close ].
]

{ #category : 'events' }
CollectablePricesStatView >> collectionsHasChanged: aCollectionList [

	"do nothing"
]

{ #category : 'initialization' }
CollectablePricesStatView >> componentActivate [

	super componentActivate.
	self getCollectableCollectionsManagerEventsSubscriber subscribe: self.
]

{ #category : 'initialization' }
CollectablePricesStatView >> componentInitialize [ 

	super componentInitialize.
	
	self initializeView.
]

{ #category : 'initialization' }
CollectablePricesStatView >> componentPassivate [
	
	self getCollectableCollectionsManagerEventsSubscriber unsubscribe: self.
	self closeSpace.
	
	super componentPassivate.
	
	
]

{ #category : 'initialization' }
CollectablePricesStatView >> componentRemove [ 

	super componentRemove.
]

{ #category : 'ui' }
CollectablePricesStatView >> createBarChart [

	"graph : evolution of nb of games each month"
	| firstDate lastDate c x y p nbMonth dates currentDate |
	firstDate := collection lessRecentDateAddedCollectible dateAdded.
	currentDate := Date today addMonths: 1.
	lastDate := firstDate. 
	nbMonth := 0.
	dates := OrderedCollection new.
	y := OrderedCollection new.
	
	"Get nb of months to display"
	[ lastDate < currentDate ] whileTrue:[ | pricePaid |
		"Get nb of game of this month"
		pricePaid := 0.
		collection collectibles select:[ :e | e dateAdded month = lastDate month ] thenDo: [ :e | pricePaid := pricePaid + e pricePaid ].
		dates add: lastDate copy.
		y add: pricePaid.
		lastDate := lastDate onNextMonth.
		nbMonth := nbMonth + 1.
	]. 
	
	x := 1 to: dates size.
	c := RSCompositeChart new.
	c extent: 800@600.
	
	p := RSBarPlot new x: (x) y: (y).
	p barSize: 6.
	p barOffset: 3.
	c add: p.
	
	"Legend format"
	c ylabel: 'Price paid'.
	c xlabel: 'Time'.
	c horizontalTick 
		labelConversion: [ :v | v = 0 ifFalse:[(dates at: v) month printString] ifTrue:[''] ];
		numberOfTicks: nbMonth;
		useVerticalLabel.
	
	c build.
	^ c canvas
]

{ #category : 'component accessing' }
CollectablePricesStatView >> getCollectableCollectionsManagerEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := CollectableCollectionsManagerEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: CollectableCollectionsManagerEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : 'component accessing' }
CollectablePricesStatView >> getCollectableCollectionsManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := CollectableCollectionsManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: CollectableCollectionsManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : 'component accessing' }
CollectablePricesStatView >> getCollectableViewEventsNotifier [
	^self eventsNotifiers at: CollectableViewEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: CollectableViewEvents name: nil].
]

{ #category : 'services' }
CollectablePricesStatView >> getView [

	^ view
]

{ #category : 'initialization' }
CollectablePricesStatView >> initializeView [
	
	view := self class pyView materializeAsBlElement first.
]

{ #category : 'services' }
CollectablePricesStatView >> openInWindow [

	self openSpace
]

{ #category : 'actions' }
CollectablePricesStatView >> openListAction [

	| app |
	app := CollectableAppImpl startWithGeneratedName.
	app populateCollectibleListWith: collection collectibles.
]

{ #category : 'services' }
CollectablePricesStatView >> openSpace [

	view ifNil: [ ^ self ].
	space ifNotNil: [ ^ self ].
	space := view openInSpace.

	"setup space properties"
	space position: 100 @ 100.

	"initialize event handlers"
	space addEventHandler: (BlEventHandler
			 on: BlSpaceClosedEvent
			 do: [ :e | self receiveBlSpaceClosedEvent: e ]).
			
	self updateTitle.
			
	^ space
]

{ #category : 'events' }
CollectablePricesStatView >> receiveBlSpaceClosedEvent: anEvent [
	"The closed event can be send after that the component is stop, because it can be have a ghost window, we need to cheeck if the component is really stopped or not"

	(MolUtils
		 isInstantiateComponentOf: self class
		 named: self componentName) ifTrue: [
		self class stop: self componentName ]
]

{ #category : 'incubator -- services' }
CollectablePricesStatView >> setCollection: aCollection [

	collection := aCollection.
	self updateGeneralStats.
	self updateView.
	self updateTitle.
]

{ #category : 'ui' }
CollectablePricesStatView >> updateGeneralStats [

	| element firstDate currentDate lastDate nbMonth monthsAverage average stream |
	
	"compute stats"
	firstDate := collection lessRecentDateAddedCollectible dateAdded.
	currentDate := Date today addMonths: 1.
	lastDate := firstDate. 
	nbMonth := 0.
	monthsAverage := OrderedCollection new.
	
	"Set the average of paid per months"
	[ lastDate < currentDate ] whileTrue:[ | pricePaid |
		"Get nb of game of this month"
		pricePaid := 0.
		collection collectibles select:[ :e | e dateAdded month = lastDate month ] thenDo: [ :e | pricePaid := pricePaid + e pricePaid ].
		lastDate := lastDate onNextMonth.
		nbMonth := nbMonth + 1.
		monthsAverage add: pricePaid.
	]. 
	
	stream := ReadWriteStream on: String new.
	
	"all"
	average := ((monthsAverage sum) / nbMonth) rounded.
	stream nextPutAll: 'All: '; nextPutAll: (average printString); ensureASpace; nextPutAll: '€$'.
	
	"last 12 months"
	monthsAverage size >= 12 ifTrue:[
		average := (((monthsAverage copyFrom: (monthsAverage size - 11) to: (monthsAverage size)) sum) / 12) rounded.
		stream ensureASpace; nextPutAll: 'last 12: '; nextPutAll: (average printString); ensureASpace; nextPutAll: '€$'.
	].
	
	"last 6 months"
	monthsAverage size >= 6 ifTrue:[
		average := (((monthsAverage copyFrom: (monthsAverage size - 5) to: (monthsAverage size)) sum) / 6) rounded.
		stream ensureASpace; nextPutAll: 'last 6: '; nextPutAll: (average printString); ensureASpace; nextPutAll: '€$'.
	].
	
	"last month"
	stream ensureASpace; nextPutAll: 'current: '; nextPutAll: (monthsAverage last printString); ensureASpace; nextPutAll: '€$'.
	
	element := view childWithId: #averageValue.
	element text: stream contents asRopedText.
	
	
]

{ #category : 'ui' }
CollectablePricesStatView >> updateTitle [

	| title |
	
	space ifNil:[ ^ self ].
	
	title := CollectableAppImpl windowTitleHead.
	collection ifNotNil:[ title := title, ' - Price paid each month for ' , collection numberOfCollectibles asString, ' collectibles' ].

	space title: title.
]

{ #category : 'ui' }
CollectablePricesStatView >> updateView [

	| roassalCanvas graphElement |
	collection ifNil: [ ^ self ].
	collection isEmpty ifTrue: [ ^ self ].

	roassalCanvas := self createBarChart.
	roassalCanvas extent: 800 @ 600.

	graphElement := BlElement id: #roassalCanvas.
	graphElement extent: roassalCanvas extent.
	graphElement background: roassalCanvas asForm asBlBackground.
	view addChild: graphElement
]
