package com.ithaca.timeline
{
	import com.ithaca.traces.Obsel;
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	[Style(name = "rendererHeight", type = "Number", inherit = "no")]	
	[Style(name = "rendererGap", type = "Number", inherit = "no")]	
	[Style(name = "title", type = "String", inherit = "no")]	
	public class TraceLine  extends LayoutNode
	{	
		//private var _title 			: String;
		public var sourceStr 			: String;
		private var _selector 			: ISelector;
		public var _obsels 				: ArrayCollection = new ArrayCollection();
		public var lastRendererHeight	: Number;
		public var lastRendererGap		: Number;
		public var autohide				: Boolean=false;
		
		public function TraceLine( tl : Timeline, tlTitle : String = null, tlSelector : ISelector = null, tlSource : String = null, tlSkinClass : String = null )
		{
			_timeline		= tl;
			titleComponent	= new TraceLineTitle( this );
			title			= tlTitle;
			if (title)
				this.name		= title;
			_selector		= tlSelector;
			sourceStr		= tlSource;		
			styleName		= tlSkinClass;			
		}
		
		public function set title ( value : String ) : void
		{			
			setStyle('title', value);			
		}
		
		public function get title (  ) : String
		{
			return getStyle('title');			
		}
		
		public function set selector ( value : ISelector ) : void
		{			
			_selector = value;
			resetObselCollection();
		}
		
		public function get selector (  ) : ISelector
		{
			return _selector;
		}

		public function getCollectionSource() : ArrayCollection
		{
			switch ( sourceStr )
			{
				case "parent" :
				{
					if ( parentNode )
					{
						if ( parentNode is TraceLine)
							return ( parentNode as TraceLine )._obsels;					
						if ( parentNode is TraceLineGroup )
							return ( parentNode as TraceLineGroup ).trace.obsels;				
					}
					return null;			
				}
				default:
				{
					var tlg : TraceLineGroup = getTraceLineGroup();
					if (tlg && tlg.trace)
						return tlg.trace.obsels;
					else 
						return null;
				}
			}
		}
		
		public function acceptObsel ( obsel : Obsel ) : Boolean
		{
			return ( !_selector || _selector.isObselMatching( obsel as Obsel ) ); 
		}
		
		public function addObsel ( obsel : Obsel ) : void 
		{
			if ( acceptObsel( obsel ) )
				_obsels.addItem( obsel );
		}
		
		public function removeObsel ( obsel : Obsel ) : void 
		{
			var obselIndex : int = _obsels.getItemIndex( obsel );
			if ( obselIndex >= 0)
				_obsels.removeItemAt( obselIndex );
		};
		
		override public function resetObselCollection ( obselsCollection : ArrayCollection = null) : void
		{		
			_obsels.disableAutoUpdate();
			_obsels.removeAll();
		
			if ( obselsCollection == null )
				obselsCollection = getCollectionSource();				
			if (obselsCollection != null && obselsCollection.length >0)
			{					
				for each( var obsel :  Obsel in obselsCollection)
					addObsel( obsel );							
			}			
			_obsels.enableAutoUpdate();
			
			if (autohide)
				SetToVisible( _obsels.length > 0 );
		}		
		
		override public function onSourceChange( event : CollectionEvent ) : void
		{
			_obsels.disableAutoUpdate();
			
			var obsel : Obsel;
			switch (event.kind)
			{
				case CollectionEventKind.ADD :
				{				
					for each ( obsel in event.items )
						addObsel( obsel );
					break;
				}				
				case CollectionEventKind.REMOVE :
				{					
					for each ( obsel in event.items )
						removeObsel( obsel );
					break;
				}
				case CollectionEventKind.REPLACE :
				break;
				
				case CollectionEventKind.RESET :	
					resetObselCollection();
				break;				
				
				default:
			}						
									
			_obsels.enableAutoUpdate();
			
			if ( autohide )
				SetToVisible( _obsels.length > 0 );
		}
						
		public function getVisibleChildrenNumber() : Number 
		{
			var numTl : Number = 0;
			for ( var lnIndex : int = 0; lnIndex < numElements; lnIndex++ )
				if ( getElementAt(lnIndex) is TraceLine && (getElementAt(lnIndex) as TraceLine).visible )
					numTl++;
			
			return numTl;
		}
		
		
		public function SetToVisible( visible: Boolean ) : void
		{
			if (this.visible == visible)
				return;
			
			this.visible 						= visible;
			titleComponent.visible				= visible;
			if ((titleComponent as TraceLineTitle).OpenButton)
				(titleComponent as TraceLineTitle).OpenButton.visible = visible && (getVisibleChildrenNumber() > 0);
				
			if (parentNode is TraceLine && parentNode.visible && parentNode.titleComponent && ((parentNode as TraceLine).titleComponent as TraceLineTitle).OpenButton)
				((parentNode as TraceLine).titleComponent as TraceLineTitle).OpenButton.visible = ((parentNode as TraceLine).getVisibleChildrenNumber() > 0 );
						
			setStyle( 'hide', !visible )					
		}
	}
}